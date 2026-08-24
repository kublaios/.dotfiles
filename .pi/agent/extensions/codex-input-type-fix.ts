/**
 * Codex input type fix
 *
 * The ChatGPT Codex SSE endpoint rejects Responses input items that have a
 * `role` but no `type`. It answers with:
 *   One of "input" or "previous_response_id" or 'prompt' or 'conversation'
 *   must be provided.
 *
 * The WebSocket transport accepts the same items. The bug therefore appears
 * only when pi falls back to SSE.
 *
 * This extension adds `type: "message"` to each affected input item, just
 * before pi sends the provider request.
 *
 * Remove this file after pi fixes the payload upstream.
 */

import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

type InputItem = Record<string, unknown>;

function needsMessageType(item: unknown): item is InputItem {
	return (
		typeof item === "object" &&
		item !== null &&
		!Array.isArray(item) &&
		"role" in item &&
		!("type" in item)
	);
}

export default function (pi: ExtensionAPI) {
	pi.on("before_provider_request", (event, ctx) => {
		// Apply the fix only to the Codex provider.
		if (ctx.model?.api !== "openai-codex-responses") return;

		const payload = event.payload as { input?: unknown } | undefined;
		if (!payload || !Array.isArray(payload.input)) return;

		if (!payload.input.some(needsMessageType)) return;

		return {
			...payload,
			input: payload.input.map((item) => (needsMessageType(item) ? { type: "message", ...item } : item)),
		};
	});
}

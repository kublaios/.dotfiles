#!/usr/bin/env bash

set -euo pipefail

current_session="${1:-}"
current_path="${2:-$HOME}"

if [[ -z "$current_session" ]]; then
  tmux display-message "Missing current session"
  exit 1
fi

if [[ "$current_session" == "__bg" ]]; then
  tmux display-message "Already in __bg"
  exit 0
fi

if tmux has-session -t __bg 2>/dev/null; then
  tmux display-message "__bg already exists"
  exit 1
fi

new_session="$(tmux new-session -d -P -F '#{session_name}' -c "$current_path")"

if [[ -z "$new_session" ]]; then
  tmux display-message "Failed to create replacement session"
  exit 1
fi

tmux rename-session -t "$new_session" __bg
tmux switch-client -t __bg

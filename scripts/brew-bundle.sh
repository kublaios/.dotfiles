#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE="${1:-${BREWFILE_EXT:-}}"

# Pinned/custom casks live in the repo; mirror them into a local tap so Brewfiles can reference them.
if [[ -d "$DOTFILES_DIR/homebrew/Casks" ]]; then
  brew tap | grep -qx "dotfiles/pinned" || brew tap-new --no-git dotfiles/pinned >/dev/null
  mkdir -p "$(brew --repository dotfiles/pinned)/Casks"
  cp "$DOTFILES_DIR"/homebrew/Casks/*.rb "$(brew --repository dotfiles/pinned)/Casks/"
  brew trust dotfiles/pinned >/dev/null 2>&1 || true
fi

brew bundle --file="$DOTFILES_DIR/Brewfile"

if [[ -n "$PROFILE" ]]; then
  PROFILE_FILE="$DOTFILES_DIR/Brewfile.$PROFILE"
  if [[ ! -f "$PROFILE_FILE" ]]; then
    echo "No Brewfile for profile: $PROFILE ($PROFILE_FILE)" >&2
    exit 1
  fi

  brew bundle --file="$PROFILE_FILE"
fi

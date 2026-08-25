#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE="${1:-${BREWFILE_EXT:-}}"

brew bundle --file="$DOTFILES_DIR/Brewfile"

if [[ -n "$PROFILE" ]]; then
  PROFILE_FILE="$DOTFILES_DIR/Brewfile.$PROFILE"
  if [[ ! -f "$PROFILE_FILE" ]]; then
    echo "No Brewfile for profile: $PROFILE ($PROFILE_FILE)" >&2
    exit 1
  fi

  brew bundle --file="$PROFILE_FILE"
fi

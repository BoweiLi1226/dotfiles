#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_CONFIG="$REPO_DIR/nvim/.config/nvim"
TARGET="$HOME/.config/nvim"

echo "==> Setting up Neovim config"

mkdir -p "$HOME/.config"

if [ -e "$TARGET" ]; then
    echo "==> Neovim config already exists, skipping"
else
    ln -s "$NVIM_CONFIG" "$TARGET"
    echo "==> Linked $TARGET -> $NVIM_CONFIG"
fi

echo
echo "==> Setup complete"

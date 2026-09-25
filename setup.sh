#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NIX_DIR="$REPO_DIR/nix"

echo "==> Setting up dotfiles"

# Install Lix if Nix is not installed
if ! command -v nix >/dev/null 2>&1; then
    echo "==> Installing Lix"
    curl -sSf -L https://install.lix.systems/lix | sh -s -- install

    echo
    echo "Lix installed."
    echo "Restart your terminal, then run ./install.sh again."
    exit 0
else
    echo "==> Nix is already installed, skipping"
fi

# Bootstrap nix-darwin
if command -v darwin-rebuild >/dev/null 2>&1; then
    echo "==> nix-darwin is already installed, applying configuration"
    sudo darwin-rebuild switch --flake "$NIX_DIR#mac"
else
    echo "==> Bootstrapping nix-darwin"
    sudo nix run nix-darwin/master#darwin-rebuild -- \
        switch --flake "$NIX_DIR#mac"
fi

# Bootstrap Home Manager
if command -v home-manager >/dev/null 2>&1; then
    echo "==> Home Manager is already installed, applying configuration"
    home-manager switch --flake "$NIX_DIR#boweili"
else
    echo "==> Bootstrapping Home Manager"
    nix run github:nix-community/home-manager -- \
        switch --flake "$NIX_DIR#boweili"
fi

echo
echo "==> Installation complete"

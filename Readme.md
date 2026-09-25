# Bowei's Dotfiles

Personal dotfiles for macOS, managed with Nix, nix-darwin, and Home Manager.

## Setup

Clone the repository:

```bash
git clone git@github.com:BoweiLi1226/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Run the setup script:

```bash
./setup.sh
```

The script will:

- Install Lix if Nix is not already installed
- Bootstrap or apply the nix-darwin configuration
- Bootstrap or apply the Home Manager configuration

If Lix is installed during setup, restart the terminal and run `./setup.sh` again.

## Nix

The Nix configuration lives in `nix/`.

- **nix-darwin** manages macOS system-level configuration.
- **Home Manager** manages user-level configuration.

### Apply configuration changes

The following commands assume the repository was cloned to the default location used above, `~/.dotfiles`. If you cloned it elsewhere, replace `~/.dotfiles` with the corresponding path.

For macOS system-level changes:

```bash
sudo darwin-rebuild switch --flake ~/.dotfiles/nix#mac
```

For user-level changes:

```bash
home-manager switch --flake ~/.dotfiles/nix#boweili
```

## Neovim

The Neovim configuration is managed by Home Manager and linked automatically when applying the Home Manager configuration.

After setup, open Neovim and run:

```vim
:checkhealth
```

Fix any remaining dependencies reported by Neovim.

### Neovim config only

To use the Neovim configuration without setting up Nix or Home Manager:

```bash
./setup_neovim_config.sh
```

This creates a symbolic link from the Neovim configuration in this repository to:

```text
~/.config/nvim
```

Existing Neovim configuration will not be overwritten.

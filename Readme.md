# Bowei's dotfiles

Clone this repository
```
git clone git@github.com:BoweiLi1226/dotfiles.git ~/.dotfiles
```

## Nix / nix-darwin
The nix-darwin configuration lives in `nix-darwin/`.

1. Install Lix
```bash
curl -sSf -L https://install.lix.systems/lix | sh -s -- install
```

   Restart the terminal and verify
```bash
nix --version
```

2. Bootstrap nix-darwin

   For the initial system setup:
```
sudo nix run nix-darwin/master#darwin-rebuild -- \
  switch --flake ~/.dotfiles/nix-darwin#mac
```

3. Bootstrap Home Manager
   For the initial user environment setup:
```
nix run github:nix-community/home-manager -- \
  switch --flake ~/.dotfiles/nix-darwin#boweili
```

4. Apply configuration changes

   For system-level changes in configuration.nix:
```
sudo darwin-rebuild switch --flake ~/.dotfiles/nix-darwin#mac
```
   For user-level changes in home.nix:
```
home-manager switch --flake ~/.dotfiles/nix-darwin#mac
```

## Neovim
The Neovim configuration is automatically linked by Home Manager when applying the nix-darwin configuration, so no additional setup is required.

After setup, open Neovim and run:
```
:checkhealth
```
Fix any remaining dependencies reported by Neovim.

### Neovim config only
If you only want to use the Neovim configuration without Nix, install GNU Stow and run from the dotfiles repository:
```bash
stow -t ~ nvim
```

## Tmux
1. Install TPM from [page](https://github.com/tmux-plugins/tpm), with following command
```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

2. Run
```bash
stow -t ~ tmux
```

3. You might need to comment out the individual plugins first to install tpm and source `tmux.conf` file.

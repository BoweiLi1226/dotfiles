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
2. Restart the terminal and verify
```bash
nix --version
```
3. Bootstrap nix-darwin
For the initial setup:
```
sudo nix run nix-darwin/master#darwin-rebuild -- \
  switch --flake ~/.dotfiles/nix-darwin#mac
```
4. Apply configuration changes
```
sudo darwin-rebuild switch --flake ~/.dotfiles/nix-darwin#mac
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

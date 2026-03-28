# Bowei's dotfiles

Dotfiles should be applied using GNU stow.

## Neovim
1. Run
```
stow -t ~ nvim
```
2. In Neovim, run `:checkhealth` and fix the rest.

## Tmux
1. Install TPM from [page](https://github.com/tmux-plugins/tpm), with following command
```
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

2. Run
```
stow -t ~ tmux
```

3. You might need to comment out the individual plugins first to install tpm and source `tmux.conf` file.

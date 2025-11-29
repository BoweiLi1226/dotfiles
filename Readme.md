# Bowei's dotfiles

Dotfiles should be applied using GNU stow.

## Neovim
1. Run
```
stow nvim
```
2. In Neovim, run `:checkhealth` and fix the rest.

## Tmux
1. Install TPM following https://github.com/tmux-plugins/tpm

2. Run
`
stow tmux
`

3. You might need to comment out the individual plugins first to install tpm and source .tmux.conf file.

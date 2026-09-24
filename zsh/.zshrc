# antidote
source "$(nix path-info nixpkgs#antidote)/share/antidote/antidote.zsh"
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# history substring search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# zoxide
eval "$(zoxide init zsh --cmd cd)"

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias ls="ls --color"
alias ll="ls -Fhl"
alias ez="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias v="nvim"
alias e='emacsclient -c -a ""'

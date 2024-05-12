source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/syntax_highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/autosuggestions/zsh-autosuggestions.zsh

# History setup
HISTFILE=$HOME/.zsh/history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^P" history-search-backward
bindkey "^N" history-search-forward


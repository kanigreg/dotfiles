source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# Plugins
source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/autosuggestion/zsh-autosuggestions.zsh

# fzf options
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# History setup
HISTFILE=$HOME/.zsh/history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^P" history-search-backward
bindkey "^N" history-search-forward


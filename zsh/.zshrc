# Plugins
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/autosuggestion/zsh-autosuggestions.zsh

bindkey '^F' autosuggest-accept
# Global
export EDITOR="nvim -n"

# PATH

path+=('~/.local/share/nvim/mason/bin')
path+=('~/minio-binaries/')

# ---=== ZSH History ===---

HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^P" history-search-backward
bindkey "^N" history-search-forward

# ---=== ZK ===---
# https://github.com/zk-org/zk

export ZK_NOTEBOOK_DIR=$HOME/Documents/neonotes/

# ---=== BAT ===---

export BAT_THEME='Catppuccin Mocha'

# ---=== MISE ===---

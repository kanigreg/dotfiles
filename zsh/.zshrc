# Plugins
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/autosuggestion/zsh-autosuggestions.zsh

# PATH

path+=('~/.local/share/nvim/mason/bin')

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

# ---=== BAT ===---

export BAT_THEME='Catppuccin Mocha'

# ---=== ASDF ===---

source $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

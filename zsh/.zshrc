source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# Plugins
source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/autosuggestion/zsh-autosuggestions.zsh

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

# ---=== FZF ===---

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
source ~/.zsh/fzf-git/fzf-git.sh

if type "fdfind" > /dev/null; then
  export FZF_DEFAULT_COMMAND="fdfind --hidden --strip-cwd-prefix --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFULT_COMMAND"
  export FZF_ALT_C_COMMAND="fdfind --type=d --hidden --strip-cwd-prefix --exclude .git"

  _fzf_compgen_path() {
    fdfind --hidden --exclude .git . "$1"
  }
  _fzf_compgen_dir() {
    fdfind --type=d --hidden --exclude .git . "$1"
  }
else
  export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

  _fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
  }
  _fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
  }
fi

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"

# ---=== BAT ===---

export BAT_THEME='Catppuccin Mocha'

search() {
  fzf --tmux --reverse --header "<C-d> Kill session"\
    --bind "ctrl-d:execute(tmux kill-session -t {})+reload-sync(tmux ls -F '#S')"
}

result=$(tmux ls -F "#S"  | search)

[[ -z "$result" ]] && exit 0

tmux switch -t "$result"

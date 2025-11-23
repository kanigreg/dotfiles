readonly PROMPT='  '
# readonly HEADER='^s    ^l    ^p    ^~  '

wrap() {
  case "$1" in
    project) " \t$2" ;;
    sample) " \t$2" ;;
  esac
}

get_options() {
  # projects=$(tmuxinator list -n | tail -n +2)
  # samples=$(find ~/Lab/ -maxdepth 1 -mindepth 1 -type d -printf "%f\n")
  #
  # printf "%s\n%s\n" "$projects" "$samples"
  {
    tmuxinator list -n | tail -n +2;
    find ~/Lab/ -maxdepth 1 -mindepth 1 -type d -printf "%f\n";
  }
}

search() {
  fzf --tmux --reverse --header "Projects and Lab samples" --prompt "$PROMPT" --print-query
}

readarray -t result <<<"$(get_options | search)"

query=${result[0]}
selection=${result[1]}

if [[ -n "$selection" ]]; then
  if ! tmuxinator start "$selection" --attach >/dev/null; then
    tmuxinator start --attach --project-config ~/Lab/"$selection"/.tmuxinator.yml
  fi
elif [[ -n "$query" ]]; then
  dot-lab create "$query"
  tmuxinator start --attach -p ~/Lab/"$query"/.tmuxinator.yml
fi

#!/bin/bash

clear
sudo pacman -Syu --noconfirm --needed git

DOTFILES_PATH="$HOME/.local/share/dotfiles"

echo -e "\nCloning repo from: https://github.com/kanigreg/dotfiles.git"
rm -fr "$DOTFILES_PATH"
git clone "https://github.com/kanigreg/dotfiles.git" ~/.local/share/dotfiles >/dev/null

# Use custom branch if instructed, otherwise default to master
DOTFILES_REF="${DOTFILES_REF:-master}"
if [[ $DOTFILES_REF != "master" ]]; then
  echo -e "\e[32mUsing branch: $DOTFILES_REF\e[0m"
  cd "$DOTFILES_PATH" || exit 2
  git fetch origin "${DOTFILES_REF}" && git checkout "${DOTFILES_REF}"
  cd - || exit 2
fi

echo -e "\nInstallation starting..."
source ~/.local/share/hydense/install.sh

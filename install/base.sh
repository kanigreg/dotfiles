#!/bin/bash

if command -v paru &> /dev/null; then
  printf "\n$INFO\n" "[paru] already installed. Skiped"
else
  printf "\n$INFO\n" "[paru] installing..."
  sudo pacman -S --needed --noconfirm base-devel
  rm -fr /tmp/paru
  git clone https://aur.archlinux.org/paru.git /tmp/paru
  cd /tmp/paru

  printf "$INFO\n" "[paru] building..."
  makepkg -si --needed --noconfirm
  cd $DOTFILES
fi

printf "$INFO\n" "packages installing..."
sudo pacman -S --needed --noconfirm \
nvim \
mise \
lazygit \
docker \
fzf \
bat \
unzip \
fd \
ripgrep \
tree-sitter-cli

paru -S --needed --noconfirm git-delta

printf "$SUCCESS\n" "Base installation finished"

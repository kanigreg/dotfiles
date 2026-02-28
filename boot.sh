#!/bin/bash

curl -o /tmp/mirrorlist https://raw.githubusercontent.com/kanigreg/dotfiles/refs/heads/main/install/mirrorlist
sudo mv /tmp/mirrorlist /etc/pacman.d/mirrorlist

sudo pacman -S --needed --noconfirm base-devel git libsecret

mkdir --parents ~/.local/share/dotfiles/
cd ~/.local/share/dotfiles/
if [ ! -d ".git" ]; then
  git clone https://github.com/kanigreg/dotfiles .
else
  git fetch
  git reset --hard origin/main
fi

source install.sh

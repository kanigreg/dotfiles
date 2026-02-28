#!/bin/bash

curl -o /tmp/mirrorlist https://raw.githubusercontent.com/kanigreg/dotfiles/refs/heads/main/install/mirrorlist
sudo mv /tmp/mirrorlist /etc/pacman.d/mirrorlist

sudo pacman -S --needed --noconfirm base-devel git libsecret

mkdir --parents ~/.local/share/dotfiles/
git clone -f https://github.com/kanigreg/dotfiles ~/.local/share/dotfiles/
cd ~/.local/share/dotfiles/

source install.sh

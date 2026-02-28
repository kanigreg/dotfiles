#!/bin/bash

printf "\n$INFO\n" "[paru] installing..."
rm -fr /tmp/paru
sudo pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/paru.git /tmp/paru
cd /tmp/paru
printf "\n$INFO\n" "[paru] building..."
makepkg -si
cd $DOTFILES

sudo pacman -S --needed --noconfirm \
nvim \
mise \
lazygit \
docker \
fzf \
bat

paru -S --needed --noconfirm git-delta

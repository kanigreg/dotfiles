#!/bin/bash

printf "\n$INFO\n" "[paru] installing..."
sudo pacman -S --needed --noconfirm base-devel
rm -fr /tmp/paru
git clone https://aur.archlinux.org/paru.git /tmp/paru
cd /tmp/paru

printf "$INFO\n" "[paru] building..."
makepkg -si
cd $DOTFILES

printf "$INFO\n" "packages installing..."
sudo pacman -S --needed --noconfirm \
nvim \
mise \
lazygit \
docker \
fzf \
bat

paru -S --needed --noconfirm git-delta

printf "$SUCCESS\n" "Base installation finished"

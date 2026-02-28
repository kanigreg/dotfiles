#!/bin/bash

sudo pacman -S --needed --noconfirm \
nvim \
mise \
lazygit \
docker \
fzf

printf "$DEBUG\n" "Copy $DOTFILES/install/bashrc to $HOME/.bashrc"
cp "$DOTFILES/install/bashrc" "$HOME/.bashrc"

printf "$INFO\n" "Configuring nvim..."
mkdir -p ~/.config

printf "$INFO\n" "Configuring mise..."

printf "$INFO\n" "Configuring docker..."
sudo systemctl enable docker
sudo usermod -aG docker "$USER"
newgrp docker

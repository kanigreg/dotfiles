#!/bin/bash

mkdir -p "$HOME/.config"
echo

printf "$DEBUG\n" "Copy $DOTFILES/install/bashrc to $HOME/.bashrc"
cp "$DOTFILES/install/bashrc" "$HOME/.bashrc"

printf "$INFO\n" "[docker] configuring..."
sudo systemctl enable docker
sudo usermod -aG docker "$USER"
newgrp docker

printf "$INFO\n" "[git] configuring..."
cp ../config/git/ "$HOME/.config/"
cp ../config/lazygit/ "$HOME/.config/"
cp ../config/delta/ "$HOME/.config/"

printf "$INFO\n" "[nvim] configuring..."
cp ../config/nvim/ "$HOME/.config/"

printf "$INFO\n" "[bat] configuring..."
cp ../config/bat/ "$HOME/.config/"
bat cache --build


printf "$SUCCESS\n" "Configuring finished"

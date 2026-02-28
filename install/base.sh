#!/bin/bash

sudo pacman -S --needed --noconfirm \
nvim \
mise \
lazygit \
docker \
fzf

printf "$INFO\n" "Configuring nvim..."
mkdir -p ~/.config
ln -snf "$DOTFILES/config/nvim" ~/.config/nvim

printf "$INFO\n" "Configuring mise..."
echo 'eval "$(mise activate bash)"' >> ~/.bashrc

printf "$INFO\n" "Configuring docker..."
sudo systemctl enable docker
sudo usermod -aG docker "$USER"
newgrp docker
docker run --rm hello-world

#!/bin/bash

sudo pacman -S --needed --noconfirm nvim mise

ln -snf "$DOTFILES/config/nvim/" ~/.config/nvim
echo 'eval "$(mise activate bash)"' >> ~/.bashrc

#!/bin/bash

mkdir -p ~/.config/hydense/themes
for src in ~/.local/share/dotfiles/hydense/themes/*; do
  ln -snf "$src" ~/.config/hydense/themes/
done

mkdir -p ~/.config/hydense/current
ln -snf ~/.config/hydense/themes/catppuccin ~/.config/hydense/current/theme

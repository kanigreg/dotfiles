#!/bin/bash

mkdir -p ~/.config/hydense/themes
for src in ~/.local/share/dotfiles/hydense/themes/*; do
  ln -snf "$src" ~/.config/hydense/themes/
done

mkdir -p ~/.config/hydense/current
ln -snf ~/.config/hydense/themes/catppuccin ~/.config/hydense/current/theme

# Some utils have no configurable path to the theme, so just link it in the required folder.
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omarchy/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/omarchy/current/theme/mako.ini ~/.config/mako/config

mkdir -p ~/.config/eza
ln -snf ~/.config/omarchy/current/theme/eza.yml ~/.config/eza/theme.yml

mkdir -p ~/.config/bat/themes
ln -snf ~/.config/omarchy/current/theme/bat.xml ~/.config/bat/themes/current.tmTheme

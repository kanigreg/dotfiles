#!/bin/bash

mkdir -p ~/.config/hydense/themes
for f in ~/.local/share/hydense/themes/*; do ln -nfs "$f" ~/.config/hydense/themes/; done

mkdir -p ~/.config/hydense/current
ln -snf ~/.config/hydense/themes/catppuccin ~/.config/hydense/current/theme

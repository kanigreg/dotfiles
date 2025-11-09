#!/bin/bash

mkdir -p ~/.config
cp -R "$DOTFILES_PATH"/hydense/config/* ~/.config/

# Use default bashrc
cp ~/.local/share/dotfiles/hydense/defaults/bashrc ~/.bashrc

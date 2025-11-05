#!/bin/bash

mkdir -p ~/.config
cp -R "$DOTFILES_PATH"/hydense/config/* ~/.config/

# TODO: Move to session manager config
cat >~/.profile <<EOF
HYDENSE=$DOTFILES_PATH/hydense
PATH="$DOTFILES_PATH/hydense/bin:\$PATH"
EOF

#!/usr/bin/env bash

cd
apt update -qy

#install deps
apt install -qy curl fzf ripgrep tree git xclip zsh make

# set zsh as default
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# build neovim
apt install -qy ninja-build gettext cmake unzip curl
git clone -b stable https://github.com/neovim/neovim || true
make -C neovim CMAKE_BUILD_TYPE=Release
make -C neovim install

cd /app/

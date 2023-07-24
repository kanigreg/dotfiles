#!/usr/bin/env bash

apt update && apt upgrade

apt install -qy curl git zsh

# build neovim
apt install -qy ninja-build gettext cmake unzip curl
git clone -b stable https://github.com/neovim/neovim || true
make -C neovim CMAKE_BUILD_TYPE=Release
make -C neovim install

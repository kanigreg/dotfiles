#!/bin/bash

sudo cp ./mirrorlist /etc/pacman.d/mirrorlist

sudo pacman -S base-devel git libsecret

mkdir ~/.config
ln -sf ../nvim/ ~/.config/nvim

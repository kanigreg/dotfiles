#!/bin/bash

mapfile -t packages < <(grep -v '^#' "$HYDENSE_INSTALL/base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"

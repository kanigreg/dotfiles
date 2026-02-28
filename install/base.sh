#!/bin/bash

sudo pacman -S --needed --noconfirm nvim mise

echo 'eval "$(mise activate bash)"' >> ~/.bashrc

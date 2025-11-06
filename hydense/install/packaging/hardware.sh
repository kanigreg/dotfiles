mapfile -t packages < <(grep -v '^#' "$HYDENSE_INSTALL/hardware.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"

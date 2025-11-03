sudo pacman -S --needed git base-devel

log "\nCloning yay repo to temp directory"
git clone "https://aur.archlinux.org/yay-bin.git" /tmp/hydense/yay >/dev/null

cd /tmp/hydense/yay || exit 2

log "\nYay installation"
makepkg -si

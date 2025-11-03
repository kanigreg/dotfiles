#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

export DOTFILES_PATH="$HOME/.local/share/dotfiles"
export HYDENSE_INSTALL="$HOME/.local/share/dotfiles/hydense/install"
export HYDENSE_LOGFILE="/var/log/hydense-install.log"
export PATH="$DOTFILES_PATH/hydense/bin:$PATH"

source "$HYDENSE_INSTALL/helpers/all.sh"
source "$HYDENSE_INSTALL/preflight/all.sh"
source "$HYDENSE_INSTALL/packaging/all.sh"

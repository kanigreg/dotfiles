#!/bin/bash

set -eEo pipefail

export DOTFILES="$HOME/.local/share/dotfiles"

source ./install/base.sh

printf "\033[32m%s\033[0m\n" "Done"

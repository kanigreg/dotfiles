#!/bin/bash

set -eEo pipefail

SUCCESS=\033[34m%s\033[0m
INFO=\033[32m%s\033[0m
FAILURE=\033[31m%s\033[0m
DEBUG=\033[90m%s\033[0m

export DOTFILES="$HOME/.local/share/dotfiles"

source ./install/base.sh

printf "$SUCCESS\n" "Done"

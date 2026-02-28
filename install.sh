#!/bin/bash

set -eEo pipefail

export SUCCESS=$'\033[32m%s\033[0m'
export INFO=$'\033[34m%s\033[0m'
export WARN=$'\033[33m%s\033[0m'
export FAILURE=$'\033[31m%s\033[0m'
export DEBUG=\033[90m%s\033[0m

export DOTFILES="$HOME/.local/share/dotfiles"

source ./install/base.sh

printf "$SUCCESS\n" "Done"

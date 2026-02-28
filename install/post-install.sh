#!/bin/bash

printf "\n$INFO\n" "Post installation"

if command -v paru &> /dev/null; then
  printf "$INFO\n" "Installing required langs"
  mise use --global node@latest
  mise use --global lua@5.1
else
printf "$WARN\n" "No mise command. Langs not istalled."
fi

#!/bin/bash

# Purpose:

# Import utils function
FILE=utils.sh
if [ -f "$FILE" ]; then
  . ./utils.sh
else
  . ./setup/utils.sh
fi
setup_color

set -e

print_info "update & upgrade system"
sudo pacman -Syu

print_info "install package"
sudo pacman -S \
  curl \
  git \
  make \
  stow \
  tmux \
  wget \
  btop \
  zsh

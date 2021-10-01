#!/bin/bash

# Purpose:

# Import utils function
. ./utils.sh
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
  zsh

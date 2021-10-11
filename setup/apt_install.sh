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
sudo apt-get update
sudo apt-get upgrade -y

print_info "install package"
sudo apt-get install -y \
  curl \
  git \
  make \
  stow \
  tmux \
  wget \
  zsh

sudo apt autoclean
sudo apt autoremove

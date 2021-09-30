#!/bin/bash

# Purpose:

# Import utils function
. ./utils.sh
setup_color

set -e

print_info "update & upgrade system"
sudo apt-get update
sudo apt-get upgrade -y

print_info "install package"
sudo apt-get install \
  curl \
  git \
  make \
  stow \
  tmux \
  wget \
  zsh

sudo apt autoclean
sudo apt autoremove

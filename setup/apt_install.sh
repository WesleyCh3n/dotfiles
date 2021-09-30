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

################################################################################
#                               install lazygit                                #
################################################################################
print_info "install lazygit"
curl -fLo lazygit.tar.gz https://github.com/jesseduffield/lazygit/releases/download/v0.29/lazygit_0.29_Linux_x86_64.tar.gz
tar xf lazygit.tar.gz
mv lazygit $HOME/.local/bin/
rm -rf lazygit.tar.gz

sudo apt autoclean
sudo apt autoremove

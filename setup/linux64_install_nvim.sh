#!/bin/bash

# Purpose: documents nvim installation

# Import utils function
FILE=utils.sh
if [ -f "$FILE" ]; then
  . ./utils.sh
else
  . ./setup/utils.sh
fi
setup_color

set -e

VERSION=0.5.1

print_info "Downloading nvim"
curl -fLo nvim.tar.gz https://github.com/neovim/neovim/releases/download/v${VERSION}/nvim-linux64.tar.gz

print_info "Extracting and Installing"
tar xf nvim.tar.gz
cp -r nvim-linux64/* $HOME/.local/

# sed -i '/wakatim/s/^/"/g'  $HOME/.config/nvim/config/plugins.vim

print_info "Installing pynvim"
pip3 install pynvim

print_info "${ORANGE}Cleaning workspace${NC}"
rm -rf ./nvim-linux64 nvim.tar.gz
print_info "${CYAN}Finished!${NC}"

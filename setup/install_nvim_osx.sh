#!/bin/bash

# Purpose: documents nvim installation

# Import utils function
. ./utils.sh
setup_color

set -e

VERSION=0.5.1

print_info "Downloading nvim"
curl -fLo nvim.tar.gz https://github.com/neovim/neovim/releases/download/v${VERSION}/nvim-macos.tar.gz

print_info "Extracting and Installing"
tar xf nvim.tar.gz
cp -r nvim-osx64/* $HOME/.local/

print_info "${ORANGE}Cleaning workspace${NC}"
rm -rf ./nvim-osx64 nvim.tar.gz
print_info "${CYAN}Finished!${NC}"

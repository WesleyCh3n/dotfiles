#!/bin/bash

# Purpose: documents nvim installation


set -e

VERSION=0.6.0

curl -fLo nvim.tar.gz https://github.com/neovim/neovim/releases/download/v${VERSION}/nvim-linux64.tar.gz

tar xf nvim.tar.gz
cp -r nvim-linux64/* $HOME/.local/

# sed -i '/wakatim/s/^/"/g'  $HOME/.config/nvim/config/plugins.vim

pip3 install pynvim

rm -rf ./nvim-linux64 nvim.tar.gz

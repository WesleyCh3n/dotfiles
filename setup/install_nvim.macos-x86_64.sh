#!/bin/bash

# Purpose: documents nvim installation


set -e

VERSION=0.6.0

curl -fLo nvim.tar.gz https://github.com/neovim/neovim/releases/download/v${VERSION}/nvim-macos.tar.gz

tar xf nvim.tar.gz
cp -r nvim-osx64/* $HOME/.local/

pip3 install pynvim

rm -rf ./nvim-osx64 nvim.tar.gz

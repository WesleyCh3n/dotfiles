#!/bin/bash

# set error exit
set -e

sudo apt-get update -y

sudo apt-get install -y --no-install-recommends git zsh curl unzip tmux make stow python3-venv

[ -d "$HOME/dotfiles/" ] && echo ERROR: dotfiles already exists && exit 1
git clone https://github.com/WesleyCh3n/dotfiles $HOME/dotfiles

cd $HOME/dotfiles && make

echo Setting up tpm
[ -d "$HOME/.tmux/plugins/tpm" ] && echo Skip
[ ! -d "$HOME/.tmux/plugins/tpm" ] && make mgr-tpm

echo Installing packages
make pkg

echo Install finished! Please login again

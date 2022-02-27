#!/bin/bash

# Purpose:


set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install \
  curl \
  git \
  make \
  stow \
  tmux \
  wget \
  zsh \
  coreutils

# install pip
python3 < <(curl -s https://bootstrap.pypa.io/get-pip.py)

brew cleanup
brew autoremove

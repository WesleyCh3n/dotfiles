#!/bin/bash

# Purpose:

# Import utils function
. ./utils.sh
setup_color

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install \
  curl \
  git \
  make \
  stow \
  tmux \
  wget \
  zsh

brew cleanup

#!/bin/bash

# Purpose:


set -e

sudo pacman -Syu

sudo pacman -S \
  curl \
  git \
  make \
  stow \
  tmux \
  wget \
  zsh

# install pip
python3 < <(curl -s https://bootstrap.pypa.io/get-pip.py)


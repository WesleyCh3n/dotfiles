#!/bin/bash

# Purpose:


set -e

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
  curl \
  git \
  make \
  stow \
  tmux \
  wget \
  zsh

# install pip
python3 < <(curl -s https://bootstrap.pypa.io/get-pip.py)

sudo apt autoclean
sudo apt autoremove

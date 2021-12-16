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

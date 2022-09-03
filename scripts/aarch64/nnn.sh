#!/usr/bin/env zsh

sudo apt-get install pkg-config libncursesw5-dev libreadline-dev
git clone --depth=1 https://github.com/jarun/nnn && cd nnn
make strip install PREFIX=~/.local

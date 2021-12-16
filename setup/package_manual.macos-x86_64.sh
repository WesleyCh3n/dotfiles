#!/bin/bash

# Purpose:


set -e

################################################################################
#                                 install nnn                                  #
################################################################################
mkdir -p /tmp/tmp_bin_dir/
cd /tmp/tmp_bin_dir/

git clone https://github.com/jarun/nnn.git && cd nnn
make O_NERD=1
mv nnn $HOME/.local/bin/

cd .. && rm /tmp/tmp_bin_dir

################################################################################
#                                 install btop                                 #
################################################################################
mkdir -p /tmp/tmp_bin_dir/
cd /tmp/tmp_bin_dir/

curl -fLo btop.tbz https://github.com/aristocratos/btop/releases/download/v$btop_version/btop-$btop_version-x86_64-macos-monterey.tbz
tar xf btop.tbz
make install PREFIX=$HOME/.local

cd .. && rm /tmp/tmp_bin_dir

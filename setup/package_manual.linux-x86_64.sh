#!/bin/bash

# Purpose:


set -e

################################################################################
#                                 install btop                                 #
################################################################################
mkdir -p /tmp/tmp_bin_dir/
cd /tmp/tmp_bin_dir/

curl -fLo btop.tbz https://github.com/aristocratos/btop/releases/download/v1.1.3/btop-x86_64-linux-musl.tbz
tar xf btop.tbz
make install PREFIX=$HOME/.local

cd .. && rm -rf /tmp/tmp_bin_dir

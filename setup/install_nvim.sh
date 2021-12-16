#!/bin/zsh

# Purpose: documents nvim installation


INSTALL_PATH=$HOME/.local
# INSTALL_PATH=~/dotfiles/setup/nvim # for debug
TMP_DIR=/tmp/tmp_bin_dir

create_and_cd_tmp_dir () {
  mkdir -p $INSTALL_PATH
  rm -rf $TMP_DIR
  mkdir -p $TMP_DIR
  cd $TMP_DIR
}

download_file () {
  echo "\nDownloading $2"
  curl -# -fLo nvim.tar.gz $1
}

extract_file () {
  tar xf nvim.tar.gz
}

install_bin () {
  cp -r ./*/* $INSTALL_PATH
}

install_requirement () {
  pip3 install pynvim
  # sed -i '/wakatim/s/^/"/g'  $HOME/.config/nvim/config/plugins.vim
}

main () {
  for k in "${(@k)NVIM}"
  do
    url=${NVIM[$k]}
    create_and_cd_tmp_dir
    download_file $url $k
    extract_file
    install_requirement
    install_bin
  done
  rm -rf $TMP_DIR
}

source $1
main

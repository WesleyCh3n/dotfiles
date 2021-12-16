#!/bin/zsh

# Purpose: easily install release binary from github
# Usage:
#   ./install_package.sh /path/to/url_file.sh
#   url_file.sh contain dict for binary and url

# INSTALL_PATH=$HOME/.local/bin
INSTALL_PATH=~/dotfiles/setup
TMP_DIR=/tmp/tmp_bin_dir

create_and_cd_tmp_dir () {
  rm -rf $TMP_DIR
  mkdir -p $TMP_DIR
  cd $TMP_DIR
}

download_file () {
  echo "\nDownloading $2"
  curl -# -fLO $1
}

extract_file () {
  tar xf $(find . -maxdepth 1 -type f) -C ./bin/
}

install_bin () {
  setopt +o nomatch
  {
    # condition: subdirectory exist
    mv ./*/$1 $INSTALL_PATH/$1 2>/dev/null
  } || {
    # previous failed, fall back
    # condition: multiple file in dir
    mv $1 $INSTALL_PATH/$1 2>/dev/null
  } || {
    # previous failed, fall back
    # condition: direct binary no extraction need chmod +x
    chmod +x *
    mv * $INSTALL_PATH/$1 2>/dev/null
  }
  echo $1 installed
}

main () {
  for k in "${(@k)BINS}"
  do
    url=${BINS[$k]}
    create_and_cd_tmp_dir
    download_file $url $k
    mkdir -p ./bin/
    {
      extract_file 2> /dev/null
    } || {
      mv $(find . -maxdepth 1 -type f) ./bin/
    }
    cd $TMP_DIR/bin
    install_bin $k
  done
  rm -rf $TMP_DIR
}

source $1
main

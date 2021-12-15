#!/bin/zsh

# INSTALL_PATH=$HOME/.local/bin
INSTALL_PATH=~/dotfiles/setup
TMP_DIR=/tmp/tmp_bin_dir

typeset -A BINS=(
["nnn"]=https://github.com/jarun/nnn/releases/download/v4.4/nnn-nerd-static-4.4.x86_64.tar.gz
["macchina"]=https://github.com/Macchina-CLI/macchina/releases/download/v6.0.1/macchina-linux-x86_64
["lazygit"]=https://github.com/jesseduffield/lazygit/releases/download/v0.31.4/lazygit_0.31.4_Linux_x86_64.tar.gz
["fd"]=https://github.com/sharkdp/fd/releases/download/v8.3.0/fd-v8.3.0-x86_64-unknown-linux-gnu.tar.gz
["rg"]=https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
# ["btop"]=https://github.com/aristocratos/btop/releases/download/v1.1.3/btop-x86_64-linux-musl.tbz
)


create_and_cd_tmp_dir () {
  rm -rf $TMP_DIR
  mkdir -p $TMP_DIR
  cd $TMP_DIR
}

download_file () {
  curl -fLO $1
}

extract_file () {
  tar xf $(find . -maxdepth 1 -type f) -C ./bin/
}

install_bin () {
  if [[ $(find ./ -maxdepth 1 -type d | wc -l) -ne 1 ]]; then
    mv ./*/$1 $INSTALL_PATH/$1
  elif [[ $(ls | wc -l) -ne "1" ]]; then
    mv $1 $INSTALL_PATH/$1
  else
    chmod +x *
    mv * $INSTALL_PATH/$1
  fi
}

main () {
  for k in "${(@k)BINS}"
  do
    url=${BINS[$k]}
    create_and_cd_tmp_dir
    download_file $url
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

main

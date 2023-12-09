
sudo apt-get update -y

sudo apt-get install -y --no-install-recommends git zsh tmux make

OUTPUT_DIR=/tmp/dotfiles
mkdir -p $OUTPUT_DIR
cd $OUTPUT_DIR

echo Download to $OUTPUT_DIR/Makefile
curl --progress-bar -fLO https://raw.githubusercontent.com/WesleyCh3n/dotfiles/main/Makefile

echo Download to $OUTPUT_DIR/pkg.mk
curl --progress-bar -fLO https://raw.githubusercontent.com/WesleyCh3n/dotfiles/main/pkg.mk

echo Download to $OUTPUT_DIR/pkg-list.mk
curl --progress-bar -fLO https://raw.githubusercontent.com/WesleyCh3n/dotfiles/main/pkg-list.mk

echo Setting up zsh
[ -d "$HOME/.zgen" ] && echo Skip
[ ! -d "$HOME/.zgen" ] && make mgr-zsh

echo Setting up tpm
[ -d "$HOME/.tmux/plugins/tpm" ] && echo Skip
[ ! -d "$HOME/.tmux/plugins/tpm" ] && make mgr-tpm

echo Installing packages
make pkg

echo Install finished! Please login again

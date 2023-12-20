
sudo apt-get update -y

sudo apt-get install -y --no-install-recommends git zsh tmux make

[ -d "$HOME/dotfiles/" ] && echo ERROR: dotfiles already exists && exit 1
git clone https://github.com/WesleyCh3n/dotfiles $HOME/dotfiles

cd $HOME/dotfiles && make

echo Setting up zsh
[ -d "$HOME/.zgen" ] && echo Skip
[ ! -d "$HOME/.zgen" ] && make mgr-zsh

echo Setting up tpm
[ -d "$HOME/.tmux/plugins/tpm" ] && echo Skip
[ ! -d "$HOME/.tmux/plugins/tpm" ] && make mgr-tpm

echo Installing packages
make pkg

echo Install finished! Please login again

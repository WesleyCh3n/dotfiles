#!/bin/bash

# Purpose:

# Import utils function
FILE=utils.sh
if [ -f "$FILE" ]; then
  . ./utils.sh
else
  . ./setup/utils.sh
fi
setup_color

set -e

################################################################################
#                         change default shell to zsh                          #
################################################################################
chsh -s "$(which zsh)"

################################################################################
#                            install zplug for zsh                             #
################################################################################
print_info "install zplug"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# git clone https://github.com/zplug/zplug $HOME/.zplug

################################################################################
#                         install nodejs for coc.nvim                          #
################################################################################
print_info "install nodejs"
curl -sL install-node.now.sh/lts | sudo bash

################################################################################
#                                install pfetch                                #
################################################################################
print_info "install pfetch"
curl -fLo $HOME/.local/bin/pfetch --create-dir https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch
chmod +x $HOME/.local/bin/pfetch

################################################################################
#                                 install nnn                                  #
################################################################################
print_info "install nnn"
git clone https://github.com/jarun/nnn.git && cd nnn
make O_NERD=1
mv nnn $HOME/.local/bin/
cd .. && rm -rf nnn

################################################################################
#                                 install btop                                 #
################################################################################
BTOP_VERSION=1.1.2
curl -fLo btop.tbz https://github.com/aristocratos/btop/releases/download/v$BTOP_VERSION/btop-$BTOP_VERSION-x86_64-macos-monterey.tbz
tar xf btop.tbz
make install PREFIX=$HOME/.local

################################################################################
#                         install tmux plugin manager                          #
################################################################################
print_info "install tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh

print_info "${CYAN}Finished!${NC}"

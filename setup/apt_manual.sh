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
print_info "change default shell to zsh"
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
curl -fLo nnn-nerd-static-4.3.x86_64.tar.gz https://github.com/jarun/nnn/releases/download/v4.3/nnn-nerd-static-4.3.x86_64.tar.gz
tar xf nnn-nerd-static-4.3.x86_64.tar.gz
mv nnn-nerd-static $HOME/.local/bin/nnn
rm -rf nnn-nerd-static-4.3.x86_64.tar.gz

################################################################################
#                               install lazygit                                #
################################################################################
print_info "install lazygit"
curl -fLo lazygit.tar.gz https://github.com/jesseduffield/lazygit/releases/download/v0.29/lazygit_0.29_Linux_x86_64.tar.gz
tar xf lazygit.tar.gz
mv lazygit $HOME/.local/bin/
rm -rf lazygit.tar.gz

################################################################################
#                         install tmux plugin manager                          #
################################################################################
print_info "install tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh

print_info "${CYAN}Finished!${NC}"

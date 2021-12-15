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
#                           install zgen for zsh                               #
################################################################################
print_info "install zgen"
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

################################################################################
#                              install macchina                                #
################################################################################
print_info "install macchina"
macchina_version=5.0.5
curl -fLo $HOME/.local/bin/macchina --create-dir https://github.com/Macchina-CLI/macchina/releases/download/v$macchina_version/macchina-linux-x86_64
chmod +x $HOME/.local/bin/macchina

################################################################################
#                                 install nnn                                  #
################################################################################
print_info "install nnn"
nnn_version="4.4"
curl -fLo nnn-nerd-static.x86_64.tar.gz https://github.com/jarun/nnn/releases/download/v${VERSION}/nnn-nerd-static-${nnn_version}.x86_64.tar.gz
tar xf nnn-nerd-static.x86_64.tar.gz
mv nnn-nerd-static $HOME/.local/bin/nnn
rm -rf nnn-nerd-static.x86_64.tar.gz

################################################################################
#                               install lazygit                                #
################################################################################
print_info "install lazygit"
lazygit_version=0.29
curl -fLo lazygit.tar.gz https://github.com/jesseduffield/lazygit/releases/download/v${lazygit_version}/lazygit_${lazygit_version}_Linux_x86_64.tar.gz
tar xf lazygit.tar.gz
mv lazygit $HOME/.local/bin/
rm -rf lazygit.tar.gz

################################################################################
#                                 install btop                                 #
################################################################################
btop_version=1.1.2
curl -fLo btop.tbz https://github.com/aristocratos/btop/releases/download/v${btop_version}/btop-${btop_version}-x86_64-linux-musl.tbz
tar xf btop.tbz
make install PREFIX=$HOME/.local

################################################################################
#                         install tmux plugin manager                          #
################################################################################
print_info "install tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh

print_info "${CYAN}Finished!${NC}"

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
#                           install zgen for zsh                               #
################################################################################
print_info "install zgen"
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

################################################################################
#                              install macchina                                #
################################################################################
print_info "install macchina"
macchina_version=5.0.5
curl -fLo $HOME/.local/bin/macchina --create-dir https://github.com/Macchina-CLI/macchina/releases/download/v$macchina_version/macchina-macos-x86_64
chmod +x $HOME/.local/bin/macchina

################################################################################
#                                 install nnn                                  #
################################################################################
print_info "install nnn"
git clone https://github.com/jarun/nnn.git && cd nnn
make O_NERD=1
mv nnn $HOME/.local/bin/
cd .. && rm -rf nnn

################################################################################
#                             install logo-ls                                  #
################################################################################
print_info "install logo-ls"
logo_ls_version=1.3.7
curl -fLo logo-ls_Darwin_x86_64.tar.gz https://github.com/Yash-Handa/logo-ls/releases/download/v$logo_ls_version/logo-ls_Darwin_x86_64.tar.gz
tar xf logo-ls_Darwin_x86_64.tar.gz
cd logo-ls_Darwin_x86_64 && cp logo-ls ~/.local/bin/
rm -rf logo-ls_Darwin_x86_64

################################################################################
#                                 install btop                                 #
################################################################################
btop_version=1.1.2
curl -fLo btop.tbz https://github.com/aristocratos/btop/releases/download/v$btop_version/btop-$btop_version-x86_64-macos-monterey.tbz
tar xf btop.tbz
make install PREFIX=$HOME/.local

################################################################################
#                         install tmux plugin manager                          #
################################################################################
print_info "install tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh

print_info "${CYAN}Finished!${NC}"

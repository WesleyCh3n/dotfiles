#!/bin/bash

# Purpose:


set -e

################################################################################
#                         change default shell to zsh                          #
################################################################################
chsh -s "$(which zsh)"

################################################################################
#                           install zgen for zsh                               #
################################################################################
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

################################################################################
#                         install tmux plugin manager                          #
################################################################################
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh

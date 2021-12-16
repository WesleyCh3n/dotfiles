#!/usr/bin/env zsh

# Purpose: install emoji font in manjaro kde

yay -S noto-fonts-emoji

# ensure running
# fc-list | grep -i "emoji"

# cat ~/.fonts.conf
# <?xml version="1.0"?><!DOCTYPE fontconfig SYSTEM "fonts.dtd">
# <fontconfig>
#   <dir>~/.fonts</dir>
#   <alias>
#     <family>MesloLGS_NF</family>
#     <prefer>
#       <family>MesloLGS NF</family> <!-- Your preferred monospace font -->
#       <family>Noto Color Emoji</family> <!-- Your preferred emoji font -->
#     </prefer>
#   </alias>
# </fontconfig>

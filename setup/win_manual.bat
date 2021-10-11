REM  Install scoop
iwr -useb get.scoop.sh | iex

REM  install git
scoop install git

REM  install nodejs
scoop install nodejs

REM  install python
scoop install python

REM  install neovom
scoop install neovim

REM  neovide
scoop bucket add extras
scoop install neovide

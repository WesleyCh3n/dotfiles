:: Install scoop
iwr -useb get.scoop.sh | iex

:: install git
scoop install git

:: install nodejs
scoop install nodejs

:: install python
scoop install python

:: install neovom
scoop install neovim

:: install pynvim for nvim
pip install pynvim

:: neovide
scoop bucket add extras
scoop install neovide

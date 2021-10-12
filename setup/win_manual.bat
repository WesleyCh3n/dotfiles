:: Install scoop
iwr -useb get.scoop.sh | iex

:: add extras bucket
scoop bucket add extras

:: install git
scoop install git lazygit

:: install nodejs
scoop install nodejs

:: install python
scoop install python

:: install neovom
scoop install neovim

:: install pynvim for nvim
pip install pynvim

:: neovide
scoop install neovide

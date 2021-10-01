" Migrate from vim 8.2
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath

" Install plugin at first initialization
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/main.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/plugin-setting.vim
source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/cocConf.vim

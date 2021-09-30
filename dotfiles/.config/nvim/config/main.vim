"===================================="
"|          Basic Config            |"
"===================================="
syntax enable
set showcmd
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ruler
set hlsearch
set confirm
set history=200
set cursorline
set number
set relativenumber
set spr
set sb
set timeout timeoutlen=1000 ttimeoutlen=0
set swapfile
set incsearch
set conceallevel=0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
set mouse=a
set fillchars+=vert:│
set showmatch
set ignorecase
set wildmenu
set backspace=indent,eol,start
set noswapfile
set nowrap
set path=.,**
set nofoldenable
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:█,extends:»,precedes:« " Unprintable chars mapping
set termguicolors
set colorcolumn=80
set guifont=MesloLGS-NF-Regular:h18
set autochdir
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Cursor shape
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


"===================================="
"|          Colorscheme             |"
"===================================="
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = ''
let g:airline#extensions#tabline#show_close_button = 1
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_transparent_background = 0
set background=dark
colorscheme gruvbox-material

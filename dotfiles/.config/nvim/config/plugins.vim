""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
" Theme
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-startify'
Plug 'camspiers/animate.vim'
Plug 'dominikduda/vim_current_word'

" Efficiency
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'phaazon/hop.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" 3dParty: REQUIRED nnn lazygit
Plug 'voldikss/vim-floaterm'

" C++
Plug 'preservim/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
" Python
Plug 'vim-python/python-syntax'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-repeat'
Plug 'pappasam/nvim-repl', {'branch': 'main'}
Plug 'Vimjas/vim-python-pep8-indent'
" Javascript
Plug 'pangloss/vim-javascript'

" Html
Plug 'mattn/emmet-vim'
" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Color Picker
Plug 'KabbAmine/vCoolor.vim'

" coc-json, coc-explorer
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" self
Plug 'wakatime/vim-wakatime'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  coc plugin                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-snippets',
\ 'coc-floaterm',
\ 'coc-explorer',
\ 'coc-tsserver',
\ 'coc-pyright'
\ ]

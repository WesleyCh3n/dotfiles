-- Install plugin at first initialization
vim.cmd([[
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
]])

--------------------------------------------------------------------------------
--                                Vim-plug                                    --
--------------------------------------------------------------------------------
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
-- Theme
Plug 'sainnhe/gruvbox-material'
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug 'glepnir/dashboard-nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'luochen1990/rainbow'
Plug 'camspiers/animate.vim'
Plug 'dominikduda/vim_current_word'

-- Efficiency
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mg979/vim-visual-multi'
Plug 'phaazon/hop.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- 3dParty: REQUIRED nnn lazygit
Plug 'voldikss/vim-floaterm'

-- C++
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/tagbar'

-- Python
Plug 'vim-python/python-syntax'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-repeat'
Plug('pappasam/nvim-repl', {branch='main'})
Plug 'Vimjas/vim-python-pep8-indent'

-- Javascript
Plug 'pangloss/vim-javascript'

-- Markdown
Plug 'plasticboy/vim-markdown'
vim.api.nvim_command('Plug \'iamcco/markdown-preview.nvim\', { \'do\': { -> mkdp#util#install() }, \'for\': [\'markdown\', \'vim-plug\']}')
-- Plug('iamcco/markdown-preview.nvim', {
    -- ['do']=function()
        -- vim.call('mkdp#util#install()')
    -- end,
    -- ['for']={'markdown','vim-plug'}
-- })

-- Color
Plug('KabbAmine/vCoolor.vim', {on={}})
Plug('lilydjwg/colorizer', {on={}})

-- coc.nvim
Plug('neoclide/coc.nvim', {branch='release'})

-- self
Plug 'wakatime/vim-wakatime'

vim.call('plug#end')

--------------------------------------------------------------------------------
--                              coc plugins                                   --
--------------------------------------------------------------------------------
vim.g.coc_global_extensions={
 'coc-json',
 'coc-snippets',
 'coc-floaterm',
 'coc-explorer',
 'coc-tsserver',
 'coc-pyright'
}

--------------------------------------------------------------------------------
--                                  Helper                                    --
--------------------------------------------------------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({function()
  -- for better look
  use {'wbthomason/packer.nvim'}
  use {'sainnhe/gruvbox-material'}
  use {'vim-airline/vim-airline'}
  use {'glepnir/dashboard-nvim'}
  use {'ryanoasis/vim-devicons'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'lukas-reineke/indent-blankline.nvim'}
  use {'luochen1990/rainbow'}
  use {'dominikduda/vim_current_word'}
  use {'junegunn/goyo.vim'}

  -- control on fly
  use {'tpope/vim-surround'}
  use {'jiangmiao/auto-pairs'}
  use {'preservim/nerdcommenter'}
  use {'junegunn/vim-easy-align'}
  use {'wellle/targets.vim'}
  use {'junegunn/vim-peekaboo'}
  use {'christoomey/vim-tmux-navigator'}
  use {'mg979/vim-visual-multi'}
  use {'phaazon/hop.nvim'}
  use {'SirVer/ultisnips'}
  use {'honza/vim-snippets'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}

  -- 3dParty: REQUIRED nnn lazygit
  use {'voldikss/vim-floaterm'}

  -- C++
  use {'octol/vim-cpp-enhanced-highlight'}
  use {'preservim/tagbar'}

  -- Python
  use {'vim-python/python-syntax'}
  use {'tmhedberg/SimpylFold'}
  use {'tpope/vim-repeat'}
  use {'pappasam/nvim-repl', branch = 'main'}
  use {'Vimjas/vim-python-pep8-indent'}

  -- Javascript
  use {'pangloss/vim-javascript'}

  -- Markdown
  use {'plasticboy/vim-markdown'}
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'}
  }

  -- Color
  use {'KabbAmine/vCoolor.vim', opt = true}
  use {'lilydjwg/colorizer', opt = true}

  -- coc.nvim
  use {'neoclide/coc.nvim', branch = 'release'}
  g.coc_global_extensions = {
   'coc-json',
   'coc-snippets',
   'coc-floaterm',
   'coc-explorer',
   'coc-tsserver',
   'coc-pyright',
   'coc-spell-checker'
  }

  -- self
  use {'wakatime/vim-wakatime'}

  end,
  config = {
    display = {open_fn = require('packer.util').float, }}
  })


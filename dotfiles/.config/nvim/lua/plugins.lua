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
  use {'hoob3rt/lualine.nvim'}
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'alvarosevilla95/luatab.nvim',
    requires='kyazdani42/nvim-web-devicons'
  }
  use {'dominikduda/vim_current_word'}
  use {'glepnir/dashboard-nvim'}
  use {'ryanoasis/vim-devicons'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'lukas-reineke/indent-blankline.nvim'}
  use {'luochen1990/rainbow'}
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup { }
    end
  }
  use {'xiyaowong/nvim-transparent'}

  -- control on fly
  use {'tpope/vim-surround'}
  use {'jiangmiao/auto-pairs'}
  use {'preservim/nerdcommenter'}
  use {'junegunn/vim-easy-align'}
  use {'wellle/targets.vim'}
  use {"tversteeg/registers.nvim"}
  use {'christoomey/vim-tmux-navigator'}
  use {'mg979/vim-visual-multi'}
  use {'phaazon/hop.nvim'}
  use {'SirVer/ultisnips'}
  use {'honza/vim-snippets'}
  use {'liuchengxu/vim-which-key'}
  use {'max397574/better-escape.nvim'}
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }
  use {
    'luukvbaal/nnn.nvim',
    config = function() require('nnn').setup() end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {'fannheyward/telescope-coc.nvim'}
  use {'cljoly/telescope-repo.nvim'}

  -- 3dParty: REQUIRED nnn lazygit
  use {'akinsho/toggleterm.nvim'}
  use {'mfussenegger/nvim-dap'}

  -- Go
  use {'fatih/vim-go'}
  use {'leoluz/nvim-dap-go',
    config = function()
      require("dap-go").setup { }
    end
  }

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
  use {'mattn/emmet-vim'}
  use {'pangloss/vim-javascript'}
  use {'MaxMEllon/vim-jsx-pretty'}

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
    'coc-go'
  }

  -- self
  use {'wakatime/vim-wakatime'}

end,
config = {
  display = {open_fn = require('packer.util').float, }}
})


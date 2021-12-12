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
  use {
    'goolord/alpha-nvim',
    config = function() require('configs.alpha') end
  }
  use {'ryanoasis/vim-devicons'}
  use {'kyazdani42/nvim-web-devicons'}
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('configs.indent-blankline')
    end
  }
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup { }
    end
  }
  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup { }
    end
  }
  use {
    'xiyaowong/nvim-transparent',
    config = function()
      require("transparent").setup({ enable = true, })
    end
  }

  -- control on fly
  use {'tpope/vim-surround'}
  use {
    'jiangmiao/auto-pairs',
    config = function()
      vim.g.AutoPairsShortcutJump = '<S-tab>'
    end
  }
  use {
    'preservim/nerdcommenter',
    config = function()
      require('configs.commenter')
    end
  }
  use {'junegunn/vim-easy-align'}
  use {'wellle/targets.vim'}
  use {'christoomey/vim-tmux-navigator'}
  use {'mg979/vim-visual-multi'}
  use {
    'phaazon/hop.nvim',
    config = function() require('hop').setup() end
  }
  use {
    'SirVer/ultisnips',
    requires = {{'honza/vim-snippets', rtp = '.'}},
    config = function()
      vim.g.UltiSnipsExpandTrigger="<C-l>"
      vim.g.UltiSnipsEditSplit="vertical"
    end
  }
  use {
    "folke/which-key.nvim",
    config = function() require('configs/which-key') end
  }
  use {
    'max397574/better-escape.nvim',
    config = function()
      require("better_escape").setup {
        mapping = {"jk", "jj", "kj"},
      }
    end
  }
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end,
    config = function() require('configs/firenvim') end
  }
  use {
    'luukvbaal/nnn.nvim',
    config = function() require('nnn').setup() end
  }
  use {
    'gelguy/wilder.nvim',
    event = "CmdlineEnter",
    config = function ()
      vim.cmd [[ source $HOME/.config/nvim/lua/configs/wilder.vim ]]
    end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('configs.telescope')
    end,
    requires = {
      'nvim-lua/plenary.nvim',
      'cljoly/telescope-repo.nvim',
    },
  }

  -- 3dParty: REQUIRED nnn lazygit
  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('configs.toggleterm')
    end
  }
  use {'mfussenegger/nvim-dap'}

  -- Go
  use {
    'fatih/vim-go',
    config = function() require("configs/vim-go") end
  }
  use {'leoluz/nvim-dap-go',
    config = function() require("dap-go").setup { } end
  }

  use {
    'pappasam/nvim-repl',
    branch = 'main',
    config = function()
      require('configs.nvim-repl')
    end
  }

  -- Javascript
  use {'mattn/emmet-vim'}
  use {'pangloss/vim-javascript'}
  use {'MaxMEllon/vim-jsx-pretty'}

  -- Markdown
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'},
    config = function() vim.g.mkdp_auto_close = 0 end
  }

  -- Color
  use {'norcalli/nvim-colorizer.lua', opt = true}

  -- coc.nvim
  -- use {
  -- 'neoclide/coc.nvim',
  -- branch = 'release',
  -- config = function()
  -- require('configs.coc')
  -- end
  -- }

  -- lsp
  use {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    config = function()
      require'configs.lspconfig'
    end
  }
  use { 'williamboman/nvim-lsp-installer', }
  use { 'ray-x/lsp_signature.nvim', event = 'BufRead' }
  use {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    config = function () require('renamer').setup() end
  }

  -- cmp
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      "quangnguyen30192/cmp-nvim-ultisnips",
      config = function()
        require("cmp-nvim-ultisnips").setup{}
      end
    },
    config = function()
      require'configs.cmp'
    end,
  }

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require'configs.treesitter'
    end
  }
  use {
    'p00f/nvim-ts-rainbow',
    event = "BufRead",
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects'
  }
  use {
    'simrat39/symbols-outline.nvim',
    cmd = {
      "SymbolsOutline",
      "SymbolsOutlineOpen",
      "SymbolsOutlineClose",
    },
    setup = function ()
      require'configs.outline'
    end
  }

  -- self
  use {'wakatime/vim-wakatime'}

end,
  config = {
    display = {open_fn = require('packer.util').float, }}
})

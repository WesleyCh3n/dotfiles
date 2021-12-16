--------------------------------------------------------------------------------
--                                  Helper                                    --
--------------------------------------------------------------------------------
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({function(use)
  use {'wbthomason/packer.nvim'}
  -- | ------------------------------------------------------------------- | --
  -- |                           for better look                           | --
  -- | ------------------------------------------------------------------- | --
  --[[ gruvbox-material colorscheme ]]
  use {
    'sainnhe/gruvbox-material',
    config = function ()
      vim.g.gruvbox_material_background             = 'medium'
      vim.g.gruvbox_material_current_word           = 'grey background'
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_transparent_background = 1
      vim.cmd('silent! colorscheme gruvbox-material')
    end
  }
  --[[ statusline ]]
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require('configs.galaxyline') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  --[[ tabline ]]
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function () require('configs.bufferline') end
  }
  --[[ current word hightlight ]]
  use {
    'RRethy/vim-illuminate',
    config = function ()
       vim.g.Illuminate_ftblacklist = {'NvimTree'}
    end
  }
  --[[ startup page ]]
  use {
    'goolord/alpha-nvim',
    config = function() require('configs.alpha') end
  }
  --[[ better indent line ]]
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('configs.indent-blankline') end
  }
  --[[ zen mode ]]
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        plugins = {
          twilight = { enabled = false },
        },
      }
    end
  }
  --[[ even more focus ]]
  use {
    "folke/twilight.nvim",
    config = function() require("twilight").setup { } end
  }
  --[[ toggle transparent ]]
  use {
    'xiyaowong/nvim-transparent',
    config = function()
      require("transparent").setup({
        enable = true,
        extra_groups = { }
      })
    end
  }
  --[[ key mapping previewer ]]
  use {
    "folke/which-key.nvim",
    config = function() require('configs/which-key') end
  }
  --[[ git status preview ]]
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('configs.gitsigns') end
  }
  --[[ let your vim commands prompt wilder ]]
  use {
    'gelguy/wilder.nvim',
    event = "CmdlineEnter",
    config = function ()
      vim.cmd [[ source $HOME/.config/nvim/lua/configs/wilder.vim ]]
    end
  }
  --[[ smooth jumping behaviors ]]
  use {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function() require('neoscroll').setup({ }) end,
  }
  --[[ better register UI ]]
  use {
    'tversteeg/registers.nvim',
    event = 'BufEnter',
    config = function()
      vim.g.registers_show_empty_registers = 0
      vim.g.registers_hide_only_whitespace = 1
      vim.g.registers_window_border = "rounded"
      vim.g.registers_window_max_width = 50
      vim.g.registers_window_min_height = 3
    end,
  }
  --[[ todo hightlight ]]
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup { }
    end
  }
  --[[ preview color ]]
  use {'norcalli/nvim-colorizer.lua', opt = true}

  -- | ------------------------------------------------------------------- | --
  -- |                           control on fly                            | --
  -- | ------------------------------------------------------------------- | --
  --[[ jump anywhere you want ]]
  use {
    'phaazon/hop.nvim',
    config = function() require('hop').setup() end
  }
  --[[ change surrounding in motion ]]
  use {'tpope/vim-surround'}
  --[[ pair surrounding ]]
  use {
    'jiangmiao/auto-pairs',
    config = function()
      vim.g.AutoPairsShortcutJump = '<S-Tab>'
    end
  }
  --[[ easy commnet ]]
  use {
    'preservim/nerdcommenter',
    config = function() require('configs.commenter') end
  }
  --[[ easy align text ]]
  use {'junegunn/vim-easy-align'}
  --[[ jump surrounding in motion ]]
  use {'wellle/targets.vim'}
  --[[ moving through tmux ]]
  use {'christoomey/vim-tmux-navigator'}
  --[[ multi cursor ]]
  use {'mg979/vim-visual-multi'}
  --[[ easy escape ]]
  use {
    'max397574/better-escape.nvim',
    config = function()
      require("better_escape").setup {
        mapping = {"jk", "jj", "kj"},
      }
    end
  }
  --[[ file explorer ]]
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', },
    config = function() require('configs.nvim-tree') end
  }
  --[[ undotree ]]
  use {
    'mbbill/undotree',
    cmd = "UndotreeToggle",
    config = function ()
      vim.g.undotree_ShortIndicators = 1
      vim.g.undotree_TreeNodeShape = "●"
      vim.g.undotree_WindowLayout = 1
      vim.g.undotree_HelpLine = 0
    end
  }

  -- | ------------------------------------------------------------------- | --
  -- |                      Telescope is your friend                       | --
  -- | ------------------------------------------------------------------- | --
  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('configs.telescope') end,
    requires = { 'nvim-lua/plenary.nvim', },
  }

  -- | ------------------------------------------------------------------- | --
  -- |                            better coding                            | --
  -- | ------------------------------------------------------------------- | --
  --[[ snippets ]]
  use {
    'SirVer/ultisnips',
    requires = {{'honza/vim-snippets', rtp = '.'}},
    config = function()
      vim.g.UltiSnipsExpandTrigger="<C-l>"
      vim.g.UltiSnipsEditSplit="vertical"
    end
  }
  --[[ better terminal in nvim ]]
  use {
    'akinsho/toggleterm.nvim',
    config = function() require('configs.toggleterm') end
  }
  --[[ send code to terminal ]]
  use {
    'pappasam/nvim-repl',
    branch = 'main',
    config = function() require('configs.nvim-repl') end
  }
  --[[ language sever protocol ]]
  use {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    requires = 'williamboman/nvim-lsp-installer',
    config = function() require('configs.lspconfig') end
  }
  --[[ lsp signature peeker ]]
  use {'ray-x/lsp_signature.nvim', event = 'BufRead'}
  --[[ better UI for rename variables ]]
  use {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    config = function () require('renamer').setup() end
  }
  --[[ lsp cmp ]]
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      "quangnguyen30192/cmp-nvim-ultisnips",
      config = function() require("cmp-nvim-ultisnips").setup{} end
    },
    config = function() require('configs.cmp') end,
  }
  --[[ lsp outline ]]
  use {
    'simrat39/symbols-outline.nvim',
    cmd = {
      "SymbolsOutline",
      "SymbolsOutlineOpen",
      "SymbolsOutlineClose",
    },
    setup = function () require('configs.outline') end
  }
  --[[ treesitter ]]
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require('configs.treesitter') end
  }
  --[[ better hightlight for parenthesis base on treesitter ]]
  use {
    'p00f/nvim-ts-rainbow',
    event = "BufRead",
    requires = "nvim-treesitter/nvim-treesitter",
  }
  --[[ treesitter as an object ]]
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    requires = "nvim-treesitter/nvim-treesitter",
  }
  -- | ------------------------------------------------------------------- | --
  -- |                          Lang improvement                           | --
  -- | ------------------------------------------------------------------- | --
  --[[ Lang: Go ]]
  use {
    'fatih/vim-go',
    config = function() require("configs/vim-go") end
  }
  --[[ Lang: Javascript ]]
  use {'mattn/emmet-vim'}
  use {'MaxMEllon/vim-jsx-pretty'}
  --[[ Lang: Markdown ]]
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'},
    config = function() vim.g.mkdp_auto_close = 0 end
  }
  --[[ dap ]] -- not much occasions to use
  --[[ use {
     [   {'mfussenegger/nvim-dap'},
     [   {
     [     'leoluz/nvim-dap-go',
     [     config = function() require("dap-go").setup { } end
     [   }
     [ } ]]

  -- | ------------------------------------------------------------------- | --
  -- |                              personal                               | --
  -- | ------------------------------------------------------------------- | --
  use {'wakatime/vim-wakatime'}

  --[[ auto packer sync ]]
  if packer_bootstrap then
    require('packer').sync()
  end
end, config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' }) -- packer floating
    end
  }
}})

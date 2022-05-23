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
    config = function () require('configs.gruvbox') end
  }
  --[[ statusline ]]
  use {
  'WesleyCh3n/galaxyline.nvim',
    branch = 'main',
    config = function() require('configs.galaxyline') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  --[[ tabline ]]
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    branch = 'main',
    config = function () require('configs.bufferline') end
  }
  --[[ current word hightlight ]]
  use {
    'RRethy/vim-illuminate',
    config = function ()
       vim.g.Illuminate_ftblacklist = {'neo-tree', 'alpha'}
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
    "Pocco81/TrueZen.nvim",
    config = function ()
      require("true-zen").setup({
        ui = {
          top = {
            showtabline = 1,
          },
          left = {
            number = true,
            relativenumber = true,
            signcolumn = "yes",
          }
        },
        modes = {
          ataraxis = {
            top_padding = 0,
            bottom_padding = 0,
			      ideal_writing_area_width = {95},
          },
          integrations = {
            galaxyline = true,
		        gitsigns = true,
            nvim_bufferline = true,
          }
        }
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
  --[[ use {
    'gelguy/wilder.nvim',
    event = "CmdlineEnter",
    config = function ()
      require('configs.wilder')
    end
  } ]]
  --[[ smooth jumping behaviors ]]
  use {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function() require('neoscroll').setup({}) end,
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
      require("todo-comments").setup {
        keywords = {
          HACK = { icon = " ", color = "warning", alt = { "QUES" } },
        },
      }
    end
  }
  --[[ preview color ]]
  use {
    'norcalli/nvim-colorizer.lua',
    opt = true,
    ft = {"html", "css", "scss", "sass", "vim", "lua", "javascript",
      "typescript", "javascriptreact", "typescriptreact", "dosini" ,
      "ini", "conf", "json", "cfg"},
    cmd = {"ColorizerToggle"},
    config = function()
      require("colorizer").setup()
      vim.cmd("ColorizerAttachToBuffer")
    end,
  }

  -- | ------------------------------------------------------------------- | --
  -- |                           control on fly                            | --
  -- | ------------------------------------------------------------------- | --
  --[[ jump anywhere you want ]]
  use {
    'ggandor/leap.nvim',
    requires = {'tpope/vim-repeat'},
    config = function ()
      require('leap').set_default_keymaps()
    end
  }
  --[[ change surrounding in motion ]]
  use {'tpope/vim-surround'}
  --[[ pair surrounding ]]
  use {'jiangmiao/auto-pairs',}
  --[[ easy commnet ]]
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
  --[[ easy align text ]]
  use {
    'junegunn/vim-easy-align',
    config=function ()
      vim.g.easy_align_interactive_modes = {'c', 'l', 'r'}
      vim.g.easy_align_bang_interactive_modes = {'c', 'l', 'r'}
    end
  }
  --[[ jump surrounding in motion ]]
  use {
    'wellle/targets.vim',
    config = function ()
      vim.g.targets_aiAI = 'aIAi'
    end
  }
  --[[ moving through tmux ]]
  use {'christoomey/vim-tmux-navigator'}
  --[[ multi cursor ]]
  use {'mg979/vim-visual-multi'}
  --[[ file explorer ]]
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
      require("neo-tree").setup({
        default_component_configs = {
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            highlight = "Label"
          },
        },
        window = {
          -- width = 35,
        },
        filesystem = {
          filtered_items = {
            hide_hidden = false,
          },
          follow_current_file = true,
          window = {
            mappings = {
              ["h"] = "navigate_up",
              ["l"] = "set_root",
            }
          }
        },
      })
    end
  }
  --[[ draw box ]]
  use {
    'gyim/vim-boxdraw',
    opt=true,
  }

  -- | ------------------------------------------------------------------- | --
  -- |                      Telescope is your friend                       | --
  -- | ------------------------------------------------------------------- | --
  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('configs.telescope') end,
    requires = { 'nvim-lua/plenary.nvim', },
  }
  use {'nvim-telescope/telescope-symbols.nvim'}

  -- | ------------------------------------------------------------------- | --
  -- |                            better coding                            | --
  -- | ------------------------------------------------------------------- | --
  --[[ snippets ]]
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      { 'saadparwaiz1/cmp_luasnip' },
      { 'WesleyCh3n/friendly-snippets' }
    }
  }
  --[[ better terminal in nvim ]]
  use {
    'akinsho/toggleterm.nvim',
    branch = 'main',
    config = function() require('configs.toggleterm') end
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
    'stevearc/dressing.nvim',
    config = function ()
      require('dressing').setup({
        input = {
          anchor = "NW",
          winblend = 0,
        }
      })
    end
  }
  --[[ lsp cmp ]]
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      "quangnguyen30192/cmp-nvim-ultisnips",
      config = function() require("cmp-nvim-ultisnips").setup{} end
    },
    config = function() require('configs.cmp') end,
  }
  use {
    'tzachar/cmp-tabnine',
    run='./install.sh',
    requires = 'hrsh7th/nvim-cmp',
    config = function ()
      local tabnine = require('cmp_tabnine.config')
      tabnine:setup({
        max_lines = 1000;
        max_num_results = 20;
        sort = true;
        run_on_every_keystroke = true;
        snippet_placeholder = '..';
        ignored_file_types = { -- default is not to ignore
          -- uncomment to ignore in lua:
          -- lua = true
        };
        show_prediction_strength = false;
      })
    end
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
  --[[ Wiki ]]
  use {
    'vimwiki/vimwiki',
    branch = 'dev',
    config = function () require('configs.vimwiki') end
  }
  --[[ Lang: Python ]]
  use {
    'psf/black',
    config = function ()
      vim.g.black_fast = 1
      vim.g.black_linelength = 79
    end
  }
  --[[ Lang: Go ]]
  use {
    'fatih/vim-go',
    config = function() require("configs/vim-go") end
  }
  --[[ Lang: Typescript, Javascript, ]]
  use {'mattn/emmet-vim'}
  use {'MaxMEllon/vim-jsx-pretty'}
  use {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = {'javascript', 'typescript', 'typescriptreact', 'javascriptreact',
          'css', 'less', 'scss', 'markdown', 'html'}
  }
  --[[ Lang: Markdown ]]
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'},
    config = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_port = '8080'
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_highlight_css =
        os.getenv("HOME") .. "/dotfiles/dotfiles/.config/nvim/gruvbox-dark-medium.css"
    end
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

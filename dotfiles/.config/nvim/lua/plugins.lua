--------------------------------------------------------------------------------
--                                  Helper                                    --
--------------------------------------------------------------------------------
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({function(use)
  use {'wbthomason/packer.nvim'}
  use {'lewis6991/impatient.nvim'}
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
    'nvim-lualine/lualine.nvim',
    after = 'gruvbox-material',
    config = function () require('configs.lualine') end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
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
       vim.g.Illuminate_ftblacklist = {'NvimTree', 'alpha'}
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
          tmux = {
            enabled = true
          }
        }
      }
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
  --[[ smooth jumping behaviors ]]
  use {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    -- config = function() require('neoscroll').setup({}) end,
  }
  use {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup{
        handle = {
          color = '#665c54',
        },
        excluded_filetypes = {
          "NvimTree",
        },
      }
    end
  }
  use {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  }
  use {
    'anuvyklack/hydra.nvim',
    config = function()
      require("configs.hydra")
    end
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
  use {
    'wellle/targets.vim',
    config = function ()
      vim.g.targets_aiAI = 'aIAi'
    end
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("configs.autopairs")
    end
  }
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          visual = "gs",
          visual_line = "gS",
        },
      })
    end
  })
  use {
    'abecodes/tabout.nvim',
    config = function ()
      require('tabout').setup {}
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function() require('configs.nvim-tree') end
  }
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup{
        mapping = {"jk", "kj", "jj", "kk"}
      }
    end,
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use {
    'junegunn/vim-easy-align',
    config=function ()
      vim.g.easy_align_interactive_modes = {'c', 'l', 'r'}
      vim.g.easy_align_bang_interactive_modes = {'c', 'l', 'r'}
    end
  }
  use {'christoomey/vim-tmux-navigator'}
  use {'mg979/vim-visual-multi'}
  use {
    "jbyuki/venn.nvim",
    config = function()
      require('configs.venn')
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
  use {'nvim-telescope/telescope-symbols.nvim'}
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function ()
      require("telescope").load_extension "file_browser"
    end
  }

  -- | ------------------------------------------------------------------- | --
  -- |                            better coding                            | --
  -- | ------------------------------------------------------------------- | --
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
    },
    config = function() require('configs.cmp') end,
  }
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      {'saadparwaiz1/cmp_luasnip'},
      {'honza/vim-snippets'},
    }
  }
  use {
    'akinsho/toggleterm.nvim',
    branch = 'main',
    config = function() require('configs.toggleterm') end
  }
  use {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    requires = 'williamboman/nvim-lsp-installer',
    config = function() require('configs.lspconfig') end
  }
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")
      saga.init_lsp_saga({
        -- your configuration
        border_style = "rounded",
        max_preview_lines = 40,
        show_outline = {
          win_width = 40,
        },
      })
    end,
  })
  use {'ray-x/lsp_signature.nvim', event = 'BufRead'}
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
  use {
    'mattn/emmet-vim',
    config = function ()
      vim.g.user_emmet_leader_key = '<C-s>'
    end
  }
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
  use { 'lambdalisue/suda.vim' }
  --[[ use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode",
            }
          },
        },
      }
    end,
    requires = "nvim-lua/plenary.nvim"
  } ]]

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

return {
  --
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          prompt_prefix = " ",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.6,
            },
          },
          border = true,
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-\\>"] = actions.close,
              ["<Tab>"] = actions.move_selection_next,
              ["<S-Tab>"] = actions.move_selection_previous,
              -- ["<CR>"] = actions.select_tab,
            },
            n = {
              ["q"] = actions.close,
              ["<Space>"] = actions.toggle_selection,
            },
          },
          file_ignore_patterns = {
            "node_modules/*",
            ".git/*"
          }
        },
        pickers = {
          find_files = {
            -- theme = "ivy",
            hidden = true,
            layout_config = {
              -- height = 0.6,
              -- preview_width=0.6
            }
          },
          diagnostics = {
            theme = "dropdown",
            -- path_display = "tail",
          },
          lsp_definitions = require("telescope.themes").get_cursor({
            -- jump_type="never",
            layout_config = {
              width = 0.8,
              height = 0.5,
              preview_width = 0.8,
            },
          }),
          lsp_code_actions = require("telescope.themes").get_cursor({
          }),
          buffers = {
            theme = "dropdown",
            show_all_buffers = true,
            ignore_current_buffer = true,
            mappings = {
              n = {
                ["dd"] = "delete_buffer",
              }
            }
          }
        },
      }
    end,
    keys = {
      { '<space>l',        '<cmd>Telescope diagnostics bufnr=0<cr>',                                 desc = ' diag' },
      { "<space>ff",       '<cmd>Telescope find_files<cr>',                                          desc = ' files' },
      { "<space>fb",       '<cmd>Telescope buffers previewer=false<cr>',                             desc = ' bufs' },
      { "<space>fc",       '<cmd>Telescope find_files cwd=~/dotfiles/dotfiles/.config/nvim/lua<cr>', desc = ' nvim dots' },
      { "<space>fd",       '<cmd>Telescope find_files cwd=~/dotfiles/<cr>',                          desc = ' dots' },
      { "<space>fg",       '<cmd>Telescope live_grep<cr>',                                           desc = ' grep' },
      { "<space>f<space>", "<cmd>Telescope commands<cr>",                                            desc = " cmd" },
    },
    dependencies = {
      {
        'nvim-telescope/telescope-symbols.nvim',
        keys = {
          { "<space>fe", '<cmd>Telescope symbols<cr>', desc = ' emoji' },
        },
      },
      {
        'nvim-telescope/telescope-file-browser.nvim',
        config = function()
          require("telescope").load_extension "file_browser"
        end,
        keys = {
          { "<space>f<cr>", "<cmd>Telescope file_browser grouped=true<cr>", desc = "Telescope" },
        }
      }
    }
  },

  --
  {
    'ggandor/leap.nvim',
    keys = {
      {
        "s",
        function()
          require('leap').leap { target_windows = { vim.fn.win_getid() } }
        end,
        mode = { "n", "x", "o" },
        desc = "Leap forward to"
      },
      { 'S',  function() _G.leap_to_line() end },
      { "gs", mode = { "n", "x", "o" },        desc = "Leap from windows" },
    },
    config = function()
      local function get_line_starts(winid)
        local wininfo = vim.fn.getwininfo(winid)[1]
        local cur_line = vim.fn.line('.')
        local targets = {}
        local lnum = wininfo.topline
        while lnum <= wininfo.botline do
          local fold_end = vim.fn.foldclosedend(lnum)
          if fold_end ~= -1 then
            lnum = fold_end + 1
          else
            if lnum ~= cur_line then table.insert(targets, { pos = { lnum, 1 } }) end
            lnum = lnum + 1
          end
        end
        local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
        local function screen_rows_from_cur(t)
          local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
          return math.abs(cur_screen_row - t_screen_row)
        end
        table.sort(targets, function(t1, t2)
          return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
        end)
        if #targets >= 1 then
          return targets
        end
      end
      function _G.leap_to_line()
        local winid = vim.api.nvim_get_current_win()
        require('leap').leap {
          target_windows = { winid },
          targets = get_line_starts(winid),
        }
      end
    end,
  },

  --
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      key_labels = {
        ["<space>"] = "SPC",
      },
      icons = {
        breadcrumb = "»",
        separator = "",
        group = " ",
      },
      window = {
        border = "single",
        margin = { 0, 0, 0, 0 },
      },
      layout = {
        height = { min = 4, max = 20 },
        width = { min = 20, max = 50 },
        spacing = 5,
        align = "center",
      },
      disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
      },
    },
    config = function(_, opts)
      local keymap = {}
      keymap.space = {
        ['#'] = 'ﴵ tab #[123]',
        ['1'] = 'which_key_ignore',
        ['2'] = 'which_key_ignore',
        ['3'] = 'which_key_ignore',
        ['4'] = 'which_key_ignore',
        ['5'] = 'which_key_ignore',
        ['6'] = 'which_key_ignore',
        ['7'] = 'which_key_ignore',
        ['8'] = 'which_key_ignore',
        ['9'] = 'which_key_ignore',
        c = { '<cmd>cd %:p:h<cr>', 'which_key_ignore' }, -- change to buf path
        e = { '<cmd>NvimTreeToggle<cr>', ' file explorer' },
        n = { '<cmd>let @/=""<cr>', ' nohl' },
        P = { '<cmd>set paste!<cr>', ' toggle paste' },
        q = { '<cmd>lua CloseBuffer()<cr>', ' quit' },
        t = { "<cmd>BufferLinePick<cr>", " pick buf" },
        w = { '<cmd>w<cr>', ' write' },
        z = { '<cmd>ZenMode<cr>', ' zen' },
        o = { '<cmd>AerialToggle!<cr>', ' outline' },
        a = { name = ' term' },
        f = { name = ' tele-' },
        r = { name = '漏re-' },
        ["ri"] = { 'gg=G<C-o>', '漏re-Indent' },
        ["rn"] = '漏rename variable',
      }
      keymap.leader = {
        ["d"] = { name = ' peek' },
        ["dd"] = ' diagnostics',
        ["f"] = { '<cmd>FormatWrite<cr>', 'Format' },
        g = { name = ' gitsgns' },
      }
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(keymap.space, { prefix = "<space>" })
      wk.register(keymap.leader, { prefix = "<leader>" })
    end,
  },

  {
    'RRethy/vim-illuminate',
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 200 },
    config = function()
      vim.g.Illuminate_ftblacklist = { 'NvimTree', 'alpha' }
    end
  },

  {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly',
    opts = {
      diagnostics         = {
        enable = true,
      },
      hijack_netrw        = true,
      open_on_tab         = true,
      update_cwd          = false,
      update_focused_file = {
        enable      = true,
        update_root = true,
        ignore_list = {}
      },
      git                 = {
        ignore = false,
      },
      view                = {
        width = 30,
        side = 'left',
        mappings = {
          custom_only = false,
          list = {
            { key = "t", cb = require 'nvim-tree.config'.nvim_tree_callback("tabnew") },
            { key = "v", cb = require 'nvim-tree.config'.nvim_tree_callback("vsplit") },
            { key = "h", cb = require 'nvim-tree.config'.nvim_tree_callback("dir_up") },
            { key = "l", cb = require 'nvim-tree.config'.nvim_tree_callback("cd") },
          }
        }
      },
      renderer            = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "➜",
              untracked = "",
              deleted = "",
              ignored = "﯏"
            },
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            }
          }
        }
      }
    },
    config = function(_, opts)
      function _G.CloseBuffer()
        local treeView = require('nvim-tree.view')
        local bufferline = require('bufferline')
        local explorerWindow = treeView.get_winnr()
        if explorerWindow == nil then
          vim.cmd('bdelete! ')
          return
        end
        local wasExplorerOpen = vim.api.nvim_win_is_valid(explorerWindow)
        local bufferToDelete = vim.api.nvim_get_current_buf()
        if (wasExplorerOpen) then
          bufferline.cycle(-1)
        end
        vim.cmd('bdelete! ' .. bufferToDelete)
      end

      require('nvim-tree').setup(opts)
    end
  },

  --
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      numhl = false,
      linehl = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true
      },
      current_line_blame = false,
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      word_diff = false,
      keymaps = {},
    },
    keys = {
      { '<leader>gh', '<cmd>Gitsigns preview_hunk<cr>', desc = ' preview hunk', },
      { '<leader>gn', '<cmd>Gitsigns next_hunk<cr>',    desc = ' next hunk', },
      { '<leader>gp', '<cmd>Gitsigns prev_hunk<cr>',    desc = ' prev hunk', },
      { '<leader>gb', '<cmd>Gitsigns blame_line<cr>',   desc = ' blame line', },
      { '<leader>gq', '<cmd>Gitsigns setqflist<cr>',    desc = '襁set quickfix list', },
    },
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<space>ft", '<cmd>TodoTelescope<cr>', desc = ' Todo' },
    }
  },

  --
  { 'mg979/vim-visual-multi' },

  --
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jk", "kj", "jj", "kk" }
    }
  },

  --
  { 'christoomey/vim-tmux-navigator' },

  --
  {
    'tamton-aquib/duck.nvim',
    lazy = true,
    keys = {
      { '<leader>k', function() require("duck").hatch() end, desc = "DUCK!!!", }
    },
  }
}

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
        breadcrumb = "",
        separator = "",
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
        ['#'] = ' tab #[123]',
        ['1'] = 'which_key_ignore',
        ['2'] = 'which_key_ignore',
        ['3'] = 'which_key_ignore',
        ['4'] = 'which_key_ignore',
        ['5'] = 'which_key_ignore',
        ['6'] = 'which_key_ignore',
        ['7'] = 'which_key_ignore',
        ['8'] = 'which_key_ignore',
        ['9'] = 'which_key_ignore',
        n = { '<cmd>let @/=""<cr>', 'nohl' },
        P = { '<cmd>set paste!<cr>', 'toggle paste' },
        q = { '<cmd>bp | bd #<cr>', 'quit' },
        t = { "<cmd>BufferLinePick<cr>", "pick buf" },
        w = { '<cmd>w<cr>', 'write' },
        o = { '<cmd>AerialToggle!<cr>', 'outline' },
        a = { name = 'term' },
        f = { name = 'tele-' },
        r = { name = 're-' },
        ["ri"] = { 'gg=G<C-o>', 're-Indent' },
        ["rn"] = 'rename variable',
      }
      keymap.leader = {
        ["d"] = { name = 'peek' },
        ["dd"] = 'diagnostics',
        ["f"] = { '<cmd>FormatWrite<cr>', 'Format' },
        g = { name = 'gitsgns' },
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

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      { "<space>e", "<cmd>Neotree toggle<cr>",            desc = "Explorer", },
      { "<space>E", "<cmd>Neotree git_status toggle<cr>", desc = "Explorer git", }
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      popup_border_style = "rounded",
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
        use_libuv_file_watcher = true,
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        git_status = {
          symbols = {
            -- Change type
            added     = "",  -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified  = "",  -- or "", but this is redundant info if you use git_status_colors on the name
            deleted   = "", -- this can only be used in the git_status source
            renamed   = "", -- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "",
            staged    = "",
            conflict  = "",
          }
        },
      },
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = "filesystem", display_name = "  Files " },
          { source = "buffers",    display_name = "  Buffers" },
          { source = "git_status", display_name = "  Git " },
        },
      }
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "*lazygit",
        callback = function()
          if package.loaded["neo-tree.sources.git_status"] then
            require("neo-tree.sources.git_status").refresh()
          end
        end,
      })
    end,
  },
  { "MunifTanjim/nui.nvim",  lazy = true },

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
      { '<leader>gh', '<cmd>Gitsigns preview_hunk<cr>', desc = 'preview hunk', },
      { '<leader>gn', '<cmd>Gitsigns next_hunk<cr>',    desc = 'next hunk', },
      { '<leader>gp', '<cmd>Gitsigns prev_hunk<cr>',    desc = 'prev hunk', },
      { '<leader>gb', '<cmd>Gitsigns blame_line<cr>',   desc = 'blame line', },
      { '<leader>gq', '<cmd>Gitsigns setqflist<cr>',    desc = 'set quickfix list', },
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

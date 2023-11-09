return {
  --
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    opts = function()
      local colors = {
        fg1    = '#282828',
        color2 = '#504945',
        fg2    = '#ddc7a1',
        color3 = '#32302f',
        color4 = '#a89984',
        color5 = '#7daea3',
        color6 = '#a9b665',
        color7 = '#d8a657',
        color8 = '#d3869b',
        color9 = '#ea6962',
      }
      local gruvbox_theme = {
        normal = {
          a = { fg = colors.fg1, bg = colors.color4, gui = 'bold' },
          b = { fg = colors.fg2, bg = colors.color2 },
          c = { fg = colors.fg2, bg = 'NONE' },
        },
        command = { a = { fg = colors.fg1, bg = colors.color5, gui = 'bold' } },
        inactive = {
          a = { fg = colors.fg2, bg = colors.color2 },
          b = { fg = 'NONE', bg = 'NONE' },
        },
        insert = { a = { fg = colors.fg1, bg = colors.color6, gui = 'bold' } },
        replace = { a = { fg = colors.fg1, bg = colors.color7, gui = 'bold' } },
        terminal = { a = { fg = colors.fg1, bg = colors.color6, gui = 'bold' } },
        visual = { a = { fg = colors.fg1, bg = colors.color9, gui = 'bold' } },
      }
      return {
        options = {
          icons_enabled = true,
          theme = gruvbox_theme,
          section_separators = { left = '', right = '' },
          component_separators = { left = '|', right = '|' },
          disabled_filetypes = { "NvimTree", "lspsagaoutline", "alpha", "aerial", "neo-tree" },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { { 'mode', separator = { left = '', right = '' } } },
          lualine_b = {
            'branch',
            -- {'diff', symbols = {added = ' ', modified = ' ', removed = ' '}},
          },
          lualine_c = {
            'filename',
            {
              'diagnostics',
              sources = { 'nvim_lsp' },
              symbols = { error = " ", warn = " ", hint = " ", info = " " },
            },
          },
          lualine_x = {
            'encoding',
            'fileformat',
            { 'filetype', icon_only = true }
          },
          lualine_y = { 'progress' },
          lualine_z = { { 'location', separator = { left = '', right = '' } } },
        },
        inactive_sections = {
          lualine_a = { { 'filename', separator = { left = '', right = '' } } },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
      }
    end
  },

  --
  {
    'akinsho/bufferline.nvim',
    event = "VeryLazy",
    opts = {
      options = {
        numbers = function(opts)
          return string.format('%s', opts.raise(opts.ordinal))
        end,
        left_trunc_marker = '',
        right_trunc_marker = '',
        middle_mouse_command = "vertical sbuffer %d",
        offsets = {
          { filetype = "NvimTree", text = " File Explorer", text_align = "center" },
          { filetype = "neo-tree", text = " File Explorer", text_align = "center" },
        },
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(_, _, diagnostics_dict, _)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
                or (e == "warning" and " " or " ")
            s = s .. n .. sym
          end
          return s
        end,
        separator_style = "thick",
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        show_close_icon = false,
        show_tab_indicators = false,
      },
      highlights = {
        fill = {
          bg = "#3c3836"
        },
        separator_selected = {
          fg = "#3c3836"
        },
        separator_visible = {
          fg = "#3c3836"
        },
        separator = {
          fg = "#3c3836"
        },
      },
    },
    keys = {
      { '<space>1', '<cmd>BufferLineGoToBuffer 1<cr>', desc = 'which_key_ignore' },
      { '<space>2', '<cmd>BufferLineGoToBuffer 2<cr>', desc = 'which_key_ignore' },
      { '<space>3', '<cmd>BufferLineGoToBuffer 3<cr>', desc = 'which_key_ignore' },
      { '<space>4', '<cmd>BufferLineGoToBuffer 4<cr>', desc = 'which_key_ignore' },
      { '<space>5', '<cmd>BufferLineGoToBuffer 5<cr>', desc = 'which_key_ignore' },
      { '<space>6', '<cmd>BufferLineGoToBuffer 6<cr>', desc = 'which_key_ignore' },
      { '<space>7', '<cmd>BufferLineGoToBuffer 7<cr>', desc = 'which_key_ignore' },
      { '<space>8', '<cmd>BufferLineGoToBuffer 8<cr>', desc = 'which_key_ignore' },
      { '<space>9', '<cmd>BufferLineGoToBuffer 9<cr>', desc = 'which_key_ignore' },
      { '<space>t', "<cmd>BufferLinePick<cr>", "pick buf" },
      { '<leader>H', '<cmd>BufferLineMovePrev<cr>', desc = ' tab move left', },
      { '<leader>L', '<cmd>BufferLineMoveNext<cr>', desc = ' tab move right', },
      { 'gt', '<cmd>BufferLineCycleNext<cr>', },
      { 'gT', '<cmd>BufferLineCyclePrev<cr>', },
    },
  },

  --
  { 'nvim-tree/nvim-web-devicons', lazy = true, },

  --
  {
    'stevearc/dressing.nvim',
    event = "LspAttach",
    opts = {
      input = {
        win_options = {
          winblend = 0,
        },
        get_config = function()
          if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
            return { enabled = false }
          end
        end,
      },
    }
  },

  --
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    opts = function()
      local header = {
        type = "text",
        val = {
          [[ __  __  ____   ___   __ __ __ ___  ___]],
          [[ ||\ || ||     // \\  || || || ||\\//||]],
          [[ ||\\|| ||==  ((   )) \\ // || || \/ ||]],
          [[ || \|| ||___  \\_//   \V/  || ||    ||]],
        },
        opts = {
          position = "center",
          hl = "Title"
        }
      }
      --[[ local date = os.date("%a %d %b")
      local heading = {
        type = "text",
        val = "  Today is " .. date,
        opts = {
          position = "center",
          hl = "Identifier",
        }
      } ]]
      local footer = {
        type = "text",
        val = require('alpha.fortune')(),
        opts = {
          position = "center",
          width = 50,
          hl = "Comment",
          hl_shortcut = "Comment",
        }
      }
      local function button(sc, txt, keybind)
        local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")
        local opts = {
          position = "center",
          text = txt,
          shortcut = sc,
          cursor = 5,
          width = 50,
          align_shortcut = "right",
          hl_shortcut = "Number",
          hl = "Function",
        }
        if keybind then
          opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
        end
        return {
          type = "button",
          val = txt,
          on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
          end,
          opts = opts,
        }
      end
      local buttons = {
        type = "group",
        val = {
          button("e", "  New file", ':ene <BAR> startinsert <CR>'),
          button("f", "  Telescope", ':Telescope find_files<cr>'),
          button("q", "  Quit NVIM", ':q<CR>'),
        },
        opts = {
          spacing = 1,
        }
      }
      local section = {
        header = header,
        buttons = buttons,
        footer = footer
      }
      local opts = {
        layout = {
          { type = "padding", val = 4 },
          section.header,
          { type = "padding", val = 2 },
          section.heading,
          { type = "padding", val = 2 },
          section.buttons,
          { type = "padding", val = 0 },
          section.footer,
        },
        opts = {
          margin = 5
        },
      }
      return opts
    end
  },

  --
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    init = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }
      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup { scope = { highlight = highlight } }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
    opts = {},
  },

  --
  {
    'SmiteshP/nvim-navic',
    lazy = true,
  },

  --
  {
    'utilyre/barbecue.nvim',
    opts = {
      exclude_filetypes = { "gitcommit", "toggleterm", "DressingInput" },
    }
  },

  --
  {
    'rcarriga/nvim-notify',
    opts = {
      background_colour = "#000000",
    },
    init = function()
      local banned_messages = { "No information available" }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        return require("notify")(msg, ...)
      end
    end,
    keys = {
      {
        "<space>n",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
  },

  --
  { 'luukvbaal/stabilize.nvim' },

  --
  {
    "petertriho/nvim-scrollbar",
    opts = {
      handle = {
        color = '#665c54',
      },
      excluded_filetypes = {
        "neo-tree",
      },
    }
  },

  --
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      text = {
        spinner = "dots"
      }
    }
  },

  --
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<space>ft", '<cmd>TodoTelescope<cr>', desc = ' Todo' },
    },
    config = true
  },
}

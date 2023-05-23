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
        always_show_bufferline = true,
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
      { '<space>1',  '<cmd>BufferLineGoToBuffer 1<cr>' },
      { '<space>2',  '<cmd>BufferLineGoToBuffer 2<cr>' },
      { '<space>3',  '<cmd>BufferLineGoToBuffer 3<cr>' },
      { '<space>4',  '<cmd>BufferLineGoToBuffer 4<cr>' },
      { '<space>5',  '<cmd>BufferLineGoToBuffer 5<cr>' },
      { '<space>6',  '<cmd>BufferLineGoToBuffer 6<cr>' },
      { '<space>7',  '<cmd>BufferLineGoToBuffer 7<cr>' },
      { '<space>8',  '<cmd>BufferLineGoToBuffer 8<cr>' },
      { '<space>9',  '<cmd>BufferLineGoToBuffer 9<cr>' },
      { '<leader>H', '<cmd>BufferLineMovePrev<cr>',    desc = ' tab move left', },
      { '<leader>L', '<cmd>BufferLineMoveNext<cr>',    desc = ' tab move right', },
      { 'gt',        '<cmd>BufferLineCycleNext<cr>', },
      { 'gT',        '<cmd>BufferLineCyclePrev<cr>', },
    },
  },

  --
  { 'nvim-tree/nvim-web-devicons', lazy = true, },

  --
  {
    'stevearc/dressing.nvim',
    lazy = true,
    opts = {
      input = {
        anchor = "NW",
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
      local date = os.date("%a %d %b")
      local plugins = ""
      if (vim.loop.os_uname().sysname ~= "Windows_NT") then
        local handle = io.popen(
          'fd -d 2 . $HOME"/.local/share/nvim/site/pack/packer" | head -n -2 | wc -l | tr -d "\n" ')
        if handle then
          plugins = handle:read("*a")
          handle:close()
        end
      else
        plugins = "??"
      end
      local heading = {
        type = "text",
        val = "┌─   Today is " .. date .. " ─┐",
        opts = {
          position = "center",
          hl = "Identifier",
        }
      }
      local plugin_count = {
        type = "text",
        val = "└─   " .. plugins .. " plugins in total ─┘",
        opts = {
          position = "center",
          hl = "Identifier",
        }
      }
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
        plugin_count = plugin_count,
        heading = heading,
        footer = footer
      }
      local opts = {
        layout = {
          { type = "padding", val = 4 },
          section.header,
          { type = "padding", val = 2 },
          section.heading,
          section.plugin_count,
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
    opts = function()
      vim.cmd [[highlight IndentBlanklineContextChar guifg=#fabd2f gui=nocombine]]
      vim.g.indent_blankline_context_patterns = {
        '^if',
        '^while',
        '^for',
        '^try',
        '^catch',
        '^type',
        '^struct',
        '^match',
        'method',
        'function',
        'class',
      }
      return {
        buftype_exclude = { 'terminal', 'help', 'nofile' },
        filetype_exclude = { "alpha", 'NvimTree', 'Outline', 'vimwiki', 'markdown' },
        show_current_context = true,
      }
    end
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
    end
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
        "NvimTree",
      },
    }
  },

  --
  {
    "j-hui/fidget.nvim",
    event = { "BufReadPost" },
    opts = {
      text = {
        spinner = "dots"
      }
    }
  }
}

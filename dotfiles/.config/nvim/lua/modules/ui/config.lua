local config = {}

function config.gruvbox()
  if vim.g.neovide == nil then
    vim.g.gruvbox_material_background   = 'medium'
    vim.g.gruvbox_material_current_word = 'grey background'
    -- vim.g.gruvbox_material_transparent_background = 1
    vim.cmd('silent! colorscheme gruvbox-material')
  end
  local set_hl = require("modules.ui.gruvbox")
  set_hl.float()
  set_hl.cmp()
end

function config.lualine()
  require("modules.ui.lualine")
end

function config.bufferline()
  require("bufferline").setup {
    options = {
      numbers = function(opts)
        return string.format('%s', opts.raise(opts.ordinal))
      end,
      left_trunc_marker = '',
      right_trunc_marker = '',
      middle_mouse_command = "vertical sbuffer %d",
      offsets = { { filetype = "NvimTree", text = " File Explorer", text_align = "center" } },
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
              or (e == "warning" and " " or " ")
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
  }
end

function config.illuminate()
  vim.g.Illuminate_ftblacklist = { 'NvimTree', 'alpha' }
end

function config.alpha()
  local alpha = require('alpha')

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
    local handle = io.popen('fd -d 2 . $HOME"/.local/share/nvim/site/pack/packer" | head -n -2 | wc -l | tr -d "\n" ')
    plugins = handle:read("*a")
    handle:close()
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
    val = "└─   " .. plugins .. " plugins in total ─┘",
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
      button("q", "  Quit NVIM", ':q<CR>'),
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
  alpha.setup(opts)
end

function config.indentline()
  require("indent_blankline").setup {
    buftype_exclude = { 'terminal', 'help', 'nofile' },
    filetype_exclude = { "alpha", 'NvimTree', 'Outline', 'vimwiki', 'markdown' },
    show_current_context = true,
  }
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
end

function config.whichkey()
  local wk = require("which-key")
  wk.setup {
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
  }
  local wk_keymap = require('keymap.whichkey')
  wk.register(wk_keymap.space, { prefix = "<space>" })
  wk.register(wk_keymap.leader, { prefix = "<leader>" })
end

function config.gitsigns()
  local present, gs = pcall(require, "gitsigns")
  if not present then
    return
  end
  gs.setup {
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
  }
end

function config.scrollbar()
  require("scrollbar").setup {
    handle = {
      color = '#665c54',
    },
    excluded_filetypes = {
      "NvimTree",
    },
  }
end

function config.stabilize()
  require("stabilize").setup()
end

function config.dressing()
  require("dressing").setup({
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
  })
end

return config

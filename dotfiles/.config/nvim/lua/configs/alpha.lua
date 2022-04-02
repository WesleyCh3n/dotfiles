local alpha = require('alpha')

local header = {
  type = "text",
  val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    [[                                                 ]],
  },
  opts = {
    position = "center",
    hl = "Type"
  }
}

local date = os.date("%a %d %b")

local handle = io.popen('fd -d 2 . $HOME"/.local/share/nvim/site/pack/packer" | head -n -2 | wc -l | tr -d "\n" ')
local plugins = handle:read("*a")
handle:close()

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
    opts.keymap = {"n", sc_, keybind, {noremap = true, silent = true}}
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
    button( "e", "  New file" , ':ene <BAR> startinsert <CR>'),
    button( "f", "  Telescope" , ':Telescope find_files<cr>'),
    button( "q", "  Quit NVIM" , ':q<CR>'),
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
    {type = "padding", val = 4},
    section.header,
    {type = "padding", val = 2},
    section.heading,
    section.plugin_count,
    {type = "padding", val = 2},
    section.buttons,
    {type = "padding", val = 0},
    section.footer,
  },
  opts = {
    margin = 5
  },
}
alpha.setup(opts)

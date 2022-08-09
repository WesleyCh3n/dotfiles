local wk = require("which-key")

wk.setup {
  key_labels = {
    ["<space>"] = "SPC",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "", -- symbol used between a key and it's label
    group = " ", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    margin = {0, 0, 0, 0},
  },
  layout = {
    height = { min = 4, max = 20 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 5, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
}

local wk_keymap = require('keymap.whichkey')

wk.register(wk_keymap.space, { prefix = "<space>" })
wk.register(wk_keymap.leader, { prefix = "<leader>" })

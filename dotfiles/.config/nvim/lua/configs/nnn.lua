
-- nnn.nvim
local builtin = require("nnn").builtin
require("nnn").setup({
  explorer = {
    width = 35,
  },
  picker = {
    style = { border = "rounded" },
  },
  auto_close = true,
  replace_netrw = "picker",
  tabs = false,
  mappings = {
		{ "<C-t>", builtin.open_in_tab },       -- open file(s) in tab
		{ "<C-s>", builtin.open_in_split },     -- open file(s) in split
		{ "<C-v>", builtin.open_in_vsplit },    -- open file(s) in vertical split
		{ "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
		{ "<C-w>", builtin.cd_to_path },        -- cd to file directory
		{ "<C-e>", builtin.populate_cmdline },  -- populate cmdline (:) with file(s)
	}
})


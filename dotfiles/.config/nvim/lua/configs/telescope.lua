
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    layout_config = {
      horizontal = {
       preview_width = 0.6,
      },
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<Tab>"] = actions.move_selection_next,
        ["<S-Tab>"] = actions.move_selection_previous,
        -- ["<CR>"] = actions.select_tab,
      },
      n = {
        ["q"] = actions.close,
      },
    },
    file_ignore_patterns = {
      "node_modules/*",
      ".git/*"
    }
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "ivy",
      mappings = {
        n = {
          ["dd"] = "delete_buffer",
        }
      }
    }
  },
}

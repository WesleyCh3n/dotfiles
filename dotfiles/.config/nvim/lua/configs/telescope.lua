
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    prompt_prefix = "  ",
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
      "%/node_modules/*",
      "%/.git/*"
    }
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    diagnostics = {
      theme = "dropdown",
      path_display = "tail",
    },
    lsp_definitions = require("telescope.themes").get_cursor({
      jump_type="never",
      layout_config = {
        width = 0.8,
        height = 0.5,
        preview_width=0.8,
      },
    }),
    lsp_code_actions = require("telescope.themes").get_cursor({
    }),
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

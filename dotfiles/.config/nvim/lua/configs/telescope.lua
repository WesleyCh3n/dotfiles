
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    prompt_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.6,
      },
    },
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
      },
    },
    file_ignore_patterns = {
      "%/node_modules/*",
      "%/.git/*"
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
      path_display = "tail",
    },
    lsp_definitions = require("telescope.themes").get_cursor({
      -- jump_type="never",
      layout_config = {
        width = 0.8,
        height = 0.5,
        preview_width=0.8,
      },
    }),
    lsp_code_actions = require("telescope.themes").get_cursor({
    }),
    buffers = {
      theme = "dropdown",
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        n = {
          ["dd"] = "delete_buffer",
        }
      }
    }
  },
}

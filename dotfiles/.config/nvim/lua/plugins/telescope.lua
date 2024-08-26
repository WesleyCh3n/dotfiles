return {
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
      { '<space>l',        '<cmd>Telescope diagnostics bufnr=0<cr>',                                 desc = 'diagnostics' },
      { "<space>ff",       '<cmd>Telescope find_files<cr>',                                          desc = 'files' },
      { "<space>fb",       '<cmd>Telescope buffers previewer=false<cr>',                             desc = 'bufs' },
      { "<space>fc",       '<cmd>Telescope find_files cwd=~/dotfiles/dotfiles/.config/nvim/lua<cr>', desc = 'nvim dots' },
      { "<space>fd",       '<cmd>Telescope find_files cwd=~/dotfiles/<cr>',                          desc = 'dots' },
      { "<space>fg",       '<cmd>Telescope live_grep<cr>',                                           desc = 'grep' },
      { "<space>f<space>", "<cmd>Telescope commands<cr>",                                            desc = "cmd" },
    },
    dependencies = {
      {
        'nvim-telescope/telescope-symbols.nvim',
        keys = {
          { "<space>fe", '<cmd>Telescope symbols<cr>', desc = 'emoji' },
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
}

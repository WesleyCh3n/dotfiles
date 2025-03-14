return {
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
      {
        'nvim-telescope/telescope-symbols.nvim',
        keys = {
          { "<space>fe", '<cmd>Telescope symbols<cr>', desc = 'emoji' },
        },
      },
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup {
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
            mappings = {
              n = {
                ["dd"] = "delete_buffer",
              }
            }
          }
        },
      }

      -- set keymap
      local builtin = require("telescope.builtin")
      local extensions = require("telescope").extensions
      vim.keymap.set("n", "<space>ff", builtin.find_files)
      -- find file without ignore
      vim.keymap.set("n", "<space>f<space>f", function()
        builtin.find_files { no_ignore = true }
      end)
      vim.keymap.set("n", "<space>fg", builtin.live_grep)
      -- grep without ignore
      vim.keymap.set("n", "<space>f<space>g", function()
        builtin.live_grep { additional_args = { '--no-ignore' } }
      end)
      vim.keymap.set("n", "<space>fm", extensions.notify.notify)
      vim.keymap.set("n", '<space>l', function()
        builtin.diagnostics { severity_bound = 0, bufnr = nil }
      end)
      vim.keymap.set("n", "<space>fb", function()
        builtin.buffers { previewer = false, sort_mru = true, ignore_current_buffer = true }
      end)
      vim.keymap.set("n", "<space>fc", function()
        builtin.find_files { cwd = "~/dotfiles/dotfiles/.config/nvim/lua" }
      end)
      vim.keymap.set("n", "<space>fd", function()
        builtin.find_files { cwd = "~/dotfiles" }
      end)
    end
  },
}

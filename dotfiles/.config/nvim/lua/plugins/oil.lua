return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["<BS>"] = { "actions.parent", mode = "n" },
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
      },
      float = {
        padding = 8,
        win_options = {
          winblend = 0,
        },
      },
      preview_win = {
        win_options = {
          winblend = 30,
        },
      },
      view_options = {
        show_hidden = true
      }
    }
    vim.keymap.set("n", "<space>e", require("oil").toggle_float, { desc = "Oil" })
  end
}

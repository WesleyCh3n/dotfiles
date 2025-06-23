return {
  --
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      win = {
        border = "rounded",
      },
      disable = {
        buftypes = {},
      },
      icons = {
        rules = false,
      },
    },
    config = function(_, opts)
      local keymap = {
        { "<space>w",  "<cmd>w<cr>",          desc = "Write" },
        { "<space>P",  "<cmd>set paste!<cr>", desc = "Toggle paste" },
        { "<leader>i", "<cmd>Lazy<cr>",       desc = "Lazy" },

        { "<space>r",  group = "Overseer-" },
        { "<space>a",  group = "Terminal-" },
        { "<space>t",  group = "Picker-" },
        { "<leader>o", group = "Obsidian-" },
        { "<leader>d", group = "Summon-" },
      }
      local wk = require("which-key")
      wk.setup(opts)
      wk.add(keymap)
    end,
  },
}

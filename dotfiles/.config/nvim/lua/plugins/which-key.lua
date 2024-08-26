return {
  --
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      win = {
        border = "none",
      },
      disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
      },
      icons = {
        rules = false,
      },
    },
    config = function(_, opts)
      local keymap = {
        { "<space>#",   desc = "tab #[123]" },
        { "<space>P",   "<cmd>set paste!<cr>",   desc = "toggle paste" },
        { "<space>a",   group = "term" },
        { "<space>d",   group = "magic" },
        { "<space>f",   group = "tele-" },
        { "<space>r",   group = "re-" },
        { "<space>ri",  "gg=G<C-o>",             desc = "re-Indent" },
        { "<space>rn",  desc = "rename variable" },
        { "<space>w",   "<cmd>w<cr>",            desc = "write" },
        { "<leader>d",  group = "peek" },
        { "<leader>dd", desc = "diagnostics" },
        { "<leader>f",  "<cmd>FormatWrite<cr>",  desc = "Format" },
        { "<leader>g",  group = "gitsgns" },
        { "<leader>l",  "<cmd>Lazy<cr>",         desc = "Lazy" },
      }
      local wk = require("which-key")
      wk.setup(opts)
      wk.add(keymap)
    end,
  },
}

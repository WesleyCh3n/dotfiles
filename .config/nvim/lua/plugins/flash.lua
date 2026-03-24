return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<c-space>", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S",         mode = { "n" },           function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
}

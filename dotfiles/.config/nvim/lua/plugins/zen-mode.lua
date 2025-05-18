return {
  {
    "folke/zen-mode.nvim",
    enabled = false,
    opts = {},
    keys = {
      { '<space>z', function() require("zen-mode").toggle({}) end, desc = "ZenMode", }
    }
  },
}

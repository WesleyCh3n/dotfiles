return {
  {
    "folke/zen-mode.nvim",
    opts = {},
    keys = {
      { '<space>z', function() require("zen-mode").toggle({}) end, desc = "ZenMode", }
    }
  },
}
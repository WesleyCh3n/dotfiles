return {
  {
    "echasnovski/mini.bufremove",
    enabled = false,
    opts = {
      silent = true,
    },
    keys = {
      { "<space>q", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<space>Q", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
    },
  },
}

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      {
        "<space>ag",
        function()
          require("snacks").terminal("lazygit", { start_insert = true, auto_close = true, auto_insert = true })
        end,
        desc = 'Lazygit'
      },
      {
        "<space>ab",
        function()
          require("snacks").terminal("btop", { start_insert = true, auto_close = true, auto_insert = true })
        end,
        desc = 'Btop'
      },
      {
        "<space>ao",
        function()
          require("snacks").terminal()
        end,
        desc = 'Float terminal'
      },
      { '<space>z', function() require("snacks").zen() end, desc = "Zen Mode", }
    },
    opts = {
      -- bigfile = { enabled = true },
      -- dashboard = { enabled = true },
      -- explorer = { enabled = true },
      indent = {
        enabled = true,
        animate = {
          enabled = false,
        }
      },
      input = { enabled = true },
      styles = {
        terminal = {
          position = "float",
          border = "rounded",
          wo = {
            winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder",
          },
          keys = {
            ["<C-_>"] = "hide"
          }
        }
      },
      terminal = {}
      -- zen = {},
      -- picker = { enabled = true },
      -- notifier = { enabled = true },
      -- quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
    },
  }
}

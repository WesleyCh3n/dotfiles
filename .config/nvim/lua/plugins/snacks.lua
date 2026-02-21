return {
  {
    "wesleych3n/snacks.nvim",
    branch = "feat-git_lstree",
    priority = 1000,
    lazy = false,
    keys = {
      { "<space>q",         function() Snacks.bufdelete() end,                                                                         desc = "Delete Buffer" },

      { "<space>ts",        function() Snacks.picker {} end,                                                                           desc = "Picker" },
      { "<space>te",        function() Snacks.picker.files { hidden = true } end,                                                      desc = "Find files" },
      { "<space>t<space>e", function() Snacks.picker.files { hidden = true, ignored = true } end,                                      desc = "Find files (show ignored)" },
      { "<space>tf",        function() Snacks.picker.grep { hidden = true } end,                                                       desc = "Grep" },
      { "<space>t<space>f", function() Snacks.picker.grep { hidden = true, ignored = true } end,                                       desc = "Grep (show ignored)" },
      { "<space>tl",        function() Snacks.picker.buffers { current = false } end,                                                  desc = "List buffers" },
      { "<space>tn",        function() Snacks.picker.files { dirs = { vim.fn.stdpath("config") }, follow = true, ignored = true } end, desc = "Nvim config" },
      {
        "<space>t.",
        function()
          Snacks.picker.git_lstree {
            cwd = vim.env.HOME, args = { "--work-tree", vim.env.HOME, "--git-dir", vim.env.HOME .. "/.dot" }, branch = "main", ignored = true }
        end,
        desc = "Dotfiles"
      },
      { "<space>tm", function() Snacks.picker.notifications {} end, desc = "Notifications" },
      { "<space>ti", function() Snacks.picker.treesitter {} end,    desc = "Treesitter outline" },

      { "<leader>g", function() Snacks.git.blame_line() end,        desc = "Blame line" },
      {
        "<space>ag",
        function()
          Snacks.terminal("lazygit", { start_insert = true, auto_close = true, auto_insert = true })
        end,
        desc = 'Lazygit'
      },
      {
        "<space>a.",
        function()
          Snacks.terminal({ "lazygit", "--work-tree", vim.env.HOME, "--git-dir", vim.env.HOME .. "/.dot" },
            { cwd = vim.env.HOME, start_insert = true, auto_close = true, auto_insert = true })
        end,
        desc = 'Lazygit'
      },
      {
        "<space>ab",
        function()
          Snacks.terminal("btop", { start_insert = true, auto_close = true, auto_insert = true })
        end,
        desc = 'Btop'
      },
      {
        "<space>ay",
        function()
          Snacks.terminal("yazi", { start_insert = true, auto_close = true, auto_insert = true })
        end,
        desc = 'Yazi'
      },
      {
        "<space>ao",
        function()
          Snacks.terminal()
        end,
        desc = 'Float terminal'
      },
      { '<space>z', function() Snacks.zen() end, desc = "Zen Mode", }
    },
    opts = {
      notifier = {},
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
      terminal = {},
      picker = {
        sources = {
          files = { hidden = true },
          todo_comments = { hidden = true },
        },
        win = {
          input = {
            keys = {
              ["<c-y>"] = { "cycle_win", mode = { "i", "n" } },
            }
          },
          list = {
            keys = {
              ["<c-y>"] = { "cycle_win", mode = { "i", "n" } },
            },
          },
          preview = {
            keys = {
              ["<c-y>"] = { "cycle_win", mode = { "i", "n" } },
            },
          }
        }
      },
      scope = { enabled = true },
      dashboard = {
        preset = {
          header = [[__  __  ____   ___   __ __ __ ___  ___
||\ || ||     // \\  || || || ||\\//||
||\\|| ||==  ((   )) \\ // || || \/ ||
|| \|| ||___  \\_//   \V/  || ||    ||]],
        },
        formats = {
          header = { hl = "Title" }
        },
        sections = {
          { section = "header" },
          { section = "startup", padding = 1 },
          {
            text = { { tostring(vim.version()), hl = "Comment" } },
            align = "center",
          },
        }
      },
      -- bigfile = { enabled = true },
      -- explorer = { enabled = true },
      -- quickfile = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
      zen = {
        toggles = {
          dim = false
        }
      }
    },
  }
}

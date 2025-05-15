return {
  {
    "folke/noice.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      local initialWinborder = vim.o.winborder
      vim.api.nvim_create_autocmd("CmdlineEnter", {
        callback = function() vim.o.winborder = "none" end,
      })
      vim.api.nvim_create_autocmd("CmdlineLeave", {
        callback = function() vim.o.winborder = initialWinborder end,
      })
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        messages = {
          -- enabled = false,
          view = "mini"
        },
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          -- lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
        routes = {
          {
            filter = {
              event = "notify",
              find = "No information available",
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "written",
            },
            opts = { skip = true },
          },
        },
      })
    end,
  }
}

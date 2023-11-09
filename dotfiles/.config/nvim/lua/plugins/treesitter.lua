return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdateSync",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      { 'nvim-treesitter/nvim-treesitter-context', opts = {} },
      'hiphish/rainbow-delimiters.nvim',
    },
    opts = function()
      vim.wo.foldmethod = "expr"
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"
      vim.wo.foldenable = false -- can be enabled directly in opened file - using 'zi' - toogle fold
      return {
        ensure_installed = {
          "python",
          "html",
          "c",
          "cpp",
          "rust",
          "css",
          "vim",
          "lua",
          "bash",
          "go",
          "javascript",
          "typescript",
          "tsx",
          "markdown",
          "markdown_inline",
        },
        highlight = {
          enable = true,
          use_languagetree = true,
          additional_vim_regex_highlighting = false,
          disable = { "latex", "bash" },
        },
        autopairs = {
          enable = true
        },
        rainbow = {
          enable = true,
          loaded = true,
          extended_mode = true,
          max_file_lines = nil,
        },
        indent = {
          enable = true
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            }
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          lsp_interop = {
            enable = true,
            border = 'single',
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
            },
          },
        },
      }
    end,
    config = function(_, opts)
      -- if type(opts.ensure_installed) == "table" then
      --   ---@type table<string, boolean>
      --   local added = {}
      --   opts.ensure_installed = vim.tbl_filter(function(lang)
      --     if added[lang] then
      --       return false
      --     end
      --     added[lang] = true
      --     return true
      --   end, opts.ensure_installed)
      -- end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}

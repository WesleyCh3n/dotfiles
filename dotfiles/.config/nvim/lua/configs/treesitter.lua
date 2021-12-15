local present, ts = pcall(require, "nvim-treesitter.configs")
if not present then
  return
end

ts.setup {
  ensure_installed = {
    "python",
    "html",
    "c",
    "cpp",
    "css",
    "vim",
    "lua",
    "bash",
    "go",
    "javascript",
    "typescript",
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
    max_file_lines = 1400,
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

-- nvim_treesitter folding
vim.wo.foldmethod="expr"
vim.o.foldexpr="nvim_treesitter#foldexpr()"
vim.wo.foldenable=false -- can be enabled directly in opened file - using 'zi' - toogle fold

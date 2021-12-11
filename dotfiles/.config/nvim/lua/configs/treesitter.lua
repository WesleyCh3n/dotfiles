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
    disable = { "latex" },
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
  }
}

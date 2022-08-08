
require("indent_blankline").setup {
  buftype_exclude = {'terminal', 'help', 'nofile'},
  filetype_exclude = {"alpha", 'NvimTree', 'Outline', 'vimwiki', 'markdown'},
  show_current_context = true,
}

vim.cmd[[highlight IndentBlanklineContextChar guifg=#fabd2f gui=nocombine]]
vim.g.indent_blankline_context_patterns = {
  '^if',
  '^while',
  '^for',
  '^try',
  '^catch',
  '^type',
  '^struct',
  '^match',
  'method',
  'function',
  'class',
}


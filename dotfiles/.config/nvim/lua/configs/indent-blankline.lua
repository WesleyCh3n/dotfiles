
require("indent_blankline").setup {
  buftype_exclude = {'terminal', 'help', },
  filetype_exclude = {"alpha", 'NvimTree', 'Outline'},
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
  'method',
  'function',
  'class',
}


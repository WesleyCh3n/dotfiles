
local my_wiki = {
  ['path'] = '~/Dropbox/wiki/',
  ['syntax'] = 'markdown',
  ['ext'] = '.md',
  ['auto_toc'] = 1
}

--[[ toc ]]
vim.g.vimwiki_toc_header_level = 3

vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_auto_chdir = 1
vim.g.vimwiki_table_mappings = 0
vim.g.vimwiki_table_auto_fmt = 0
vim.g.vimwiki_list = { my_wiki }
vim.g.vimwiki_ext2syntax = {
  ['.md'] = 'markdown',
  ['.markdown'] = 'markdown',
  ['.mdown'] = 'markdown'
}
vim.g.vimwiki_global_ext = 0

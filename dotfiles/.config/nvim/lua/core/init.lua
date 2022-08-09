-- python executable
if vim.loop.os_uname().sysname == 'Windows_NT' then
  vim.g.python3_host_prog='~/scoop/shims/python3.exe'
end

-- core option
require('core.options')

-- packer
local pack = require('core.pack')
pack.ensure_plugins()
pack.load_compile()

-- keymap
require('keymap')

-- autocmd
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = "*",
  command = "%s/\\s\\+$//e"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "*.md",
  command = "setlocal wrap spell"
})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = "*",
  command = "silent! TSBufEnable rainbow"
})

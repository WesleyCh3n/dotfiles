-- python executable
if vim.loop.os_uname().sysname == 'Windows_NT' then
  vim.g.python3_host_prog = '~/scoop/shims/python3.exe'
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
-- remember cursor last place
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = "*",
  command = [[if line("'\"") > 2 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*",
  command = "%s/\\s\\+$//e"
})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*.md",
  command = "setlocal wrap spell"
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = "*",
  command = "silent! TSBufEnable rainbow"
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  command = "silent! lua vim.lsp.buf.format()"
})

if vim.g.neovide == true then
  vim.opt.guifont                               = 'VictorMono Nerd Font Mono:h13'
  vim.g.neovide_transparency                    = 0.8
  vim.g.gruvbox_material_background             = 'medium'
  vim.g.gruvbox_material_current_word           = 'grey background'
  vim.g.gruvbox_material_transparent_background = 0
  vim.cmd('silent! colorscheme gruvbox-material')
  local set_hl = require("modules.ui.gruvbox")
  set_hl.float()
  set_hl.cmp()
  set_hl.winbar()
end

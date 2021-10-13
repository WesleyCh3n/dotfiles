if vim.fn.has('win32') == 1 then
  vim.g.python3_host_prog='~/scoop/shims/python3.exe'
  vim.g.floaterm_shell = 'powershell'
  HOME_DIR = '~/AppData/Local/nvim/'
else
  HOME_DIR = '~/.config/nvim/'
end
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_vfx_mode = "railgun"

require('plugins')
require('main')
require('mappings')
require('plugin-settings')

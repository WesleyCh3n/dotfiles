if vim.fn.has('win32') == 1 then
  vim.g.python3_host_prog='~/scoop/shims/python3.exe'
  vim.g.floaterm_shell = 'powershell'
  -- HOME_DIR = '~/AppData/Local/nvim/'
  DOTFILE_DIR = '~/dotfiles/dotfiles/.config/nvim/'
else
  DOTFILE_DIR = '~/dotfiles/dotfiles/.config/nvim/'
end
-- vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_vfx_mode = "railgun"

local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end
prequire('impatient')

require('plugins')
require('main')
require('mappings')

if vim.fn.has('win32') == 1 then
  vim.g.python3_host_prog='~/scoop/shims/python3.exe'
  HOME_DIR = '~/AppData/Local/nvim/'
else
  HOME_DIR = '~/.config/nvim/'
end

require('plugins')
require('main')
require('mappings')
require('plugin-settings')

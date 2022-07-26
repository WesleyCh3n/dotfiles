if vim.fn.has('win32') == 1 then
  vim.g.python3_host_prog='~/scoop/shims/python3.exe'
end

local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end
prequire('impatient')

require('plugins')
require('main')
require('mappings')

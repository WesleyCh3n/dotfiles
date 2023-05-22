local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end
prequire('impatient')

require('core')

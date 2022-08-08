local keymap = {}

vim.g.mapleader = ','

local keymap_set = function(mode, tbl)
  vim.validate({tbl = {tbl, 'table'}})
  local len = #tbl
  if len < 2 then
    vim.notify("keymap must have rhs")
  end
  local options = len == 3 and tbl[3] or {
    noremap = true,
    silent = true,
    nowait = false,
    expr = false,
  }
  vim.keymap.set(mode, tbl[1], tbl[2], options)
end

local function map_set(mode)
  return function (tbl)
    vim.validate({
      tbl = { tbl, 'table' },
    })

    if type(tbl[1]) == 'table' and type(tbl[2]) == 'table' then
      for _, v in pairs(tbl) do
        keymap_set(mode, v)
      end
    else
      keymap_set(mode, tbl)
    end
  end
end

keymap.nmap = map_set('n')
keymap.imap = map_set('i')
keymap.cmap = map_set('c')
keymap.vmap = map_set('v')
keymap.xmap = map_set('x')
keymap.tmap = map_set('t')

return keymap

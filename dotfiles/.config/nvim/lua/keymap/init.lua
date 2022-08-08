require('keymap.config')
local keymap = require('core.keymap')
local nmap = keymap.nmap
local imap = keymap.imap
local xmap = keymap.xmap

nmap({
  {'<space>1', '<cmd>BufferLineGoToBuffer 1<cr>'},
  {'<space>2', '<cmd>BufferLineGoToBuffer 2<cr>'},
  {'<space>3', '<cmd>BufferLineGoToBuffer 3<cr>'},
  {'<space>4', '<cmd>BufferLineGoToBuffer 4<cr>'},
  {'<space>5', '<cmd>BufferLineGoToBuffer 5<cr>'},
  {'<space>6', '<cmd>BufferLineGoToBuffer 6<cr>'},
  {'<space>7', '<cmd>BufferLineGoToBuffer 7<cr>'},
  {'<space>8', '<cmd>BufferLineGoToBuffer 8<cr>'},
  {'<space>9', '<cmd>BufferLineGoToBuffer 9<cr>'},
})

-- vim-easy-align
xmap(
  {'ga', '<Plug>(EasyAlign)', {noremap = false, silent = true}}
)
nmap(
  {'ga', '<Plug>(EasyAlign)', {noremap = false, silent = true}}
)

-- A multiline tabout setup could look like this
imap({
  {'<A-n>', "<Plug>(TaboutMulti)", {noremap = false, silent = true}},
  {'<A-p>', "<Plug>(TaboutBackMulti)", {noremap = false, silent = true}}
})

local keymap = require('core.keymap')
local nmap = keymap.nmap
local imap = keymap.imap
local vmap = keymap.vmap
local tmap = keymap.tmap

nmap({
  { 'Q', '<NOP>' }, -- no EX mode
  { 'n', 'nzzzv' }, -- Keep cursor center
  { 'N', 'Nzzzv' },
  { 'J', 'mzJ`z' },
})

imap({
  { '<C-A>', '<Home>' },
  { '<C-E>', '<End>' },

  { ',', ',<c-g>u' }, -- Undo break point
  { '.', '.<c-g>u' },
  { '!', '!<c-g>u' },
  { '?', '?<c-g>u' },
})

-- yank to system clipboard
vmap({ '<C-c>', '"+y' })

-- escape terminal
tmap({ '<C-\\>', '<C-\\><C-n>', { silent = false } })

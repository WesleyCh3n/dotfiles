local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- no Ex mode
map('n', 'Q', '<NOP>')

-- Keep cursor center
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')


-- start/end word
map('i', '<C-A>', '<Home>')
map('i', '<C-E>', '<End>')

-- yank to system clipboard
map('v', '<C-c>', '"+y')

-- Undo break point
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')

map('t', '<C-\\>', '<C-\\><C-n>', { silent = false })
map('t', '<C-_>', '<C-\\><C-n>', { silent = false })

-- clear last used search pattern
map('n', "<leader>n", ':let @/ =""<cr>')

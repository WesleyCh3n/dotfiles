--------------------------------------------------------------------------------
--                                  Helper                                    --
--------------------------------------------------------------------------------
local g = vim.g      -- a table to access global variables
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
--------------------------------------------------------------------------------
--                                  Default                                   --
--------------------------------------------------------------------------------
g.mapleader = ','

-- no EX mode
map('n', 'Q', '<NOP>')

-- start/end word
map('i', '<C-A>', '<Home>')
map('i', '<C-E>', '<End>')

-- yank to system clipboard
map('v', '<C-c>', '"+y')

-- Tab
function _G.goto_tab(num)
  return num..'gt'
end
for _,num in ipairs({1,2,3,4,5,6,7,8,9}) do
  map('n', '<space>'..num, '<cmd>BufferLineGoToBuffer '..num..'<cr>')
end

-- escape terminal
map('t', '<C-\\>', '<C-\\><C-n>', {silent = false})

-- apply q register in visual mode
map('v', '.', ':norm! @q<cr>')

-- Keep cursor center
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

-- Undo break point
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')

--------------------------------------------------------------------------------
--                                  Plugin                                    --
--------------------------------------------------------------------------------

-- vim-easy-align
map('x', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = true})
map('n', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = true})

-- A multiline tabout setup could look like this
map('i', '<A-n>', "<Plug>(TaboutMulti)", {noremap = false, silent = true})
map('i', '<A-p>', "<Plug>(TaboutBackMulti)", {noremap = false, silent = true})

--------------------------------------------------------------------------------
--                                 Augroup                                    --
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = "*",
  command = "%s/\\s\\+$//e"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "*.md",
  command = "setlocal wrap spell"
})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = "*",
  command = "silent! TSBufEnable rainbow"
})

--------------------------------------------------------------------------------
--                                  Helper                                    --
--------------------------------------------------------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
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

-- better_escape
map('i', 'jk', '<Esc>')
map('i', 'kj', '<Esc>')
map('i', 'jj', '<Esc>')

-- write/close file
function CloseBuffer()
  local treeView = require('nvim-tree.view')
  local bufferline = require('bufferline')
  local explorerWindow = treeView.get_winnr()
  if explorerWindow == nil then
    vim.cmd('bdelete! ')
    return
  end
  local wasExplorerOpen = vim.api.nvim_win_is_valid(explorerWindow)
  local bufferToDelete = vim.api.nvim_get_current_buf()
  if (wasExplorerOpen) then
    bufferline.cycle(-1)
  end
  vim.cmd('bdelete! ' .. bufferToDelete)
end

map('n', '<space>w', ':w<cr>')
map('n', '<space>q', ':lua CloseBuffer()<cr>')
map('n', '<space>Q', ':%bd|e#|bd#<cr>')

-- cd buf
map('n', '<space>c', ':cd %:p:h<cr>')

-- start/end word
-- map('n', '0', '^')
-- map('n', '9', '$')
map('i', '<C-A>', '<Home>')
map('i', '<C-E>', '<End>')

-- nohlsearch
map('n', '<leader>n', ':let @/=""<cr>')

-- yank to system clipboard
map('v', '<C-c>', '"+y')

-- Tab
function _G.goto_tab(num)
  return num..'gt'
end
for _,num in ipairs({1,2,3,4,5,6,7,8,9}) do
  map('n', '<space>'..num, '<cmd>BufferLineGoToBuffer '..num..'<cr>')
end
-- Move tab
map('n', '<leader>L', ':BufferLineMoveNext<cr>')
map('n', '<leader>H', ':BufferLineMovePrev<cr>')

-- Jump tab
map('n', '<leader>t', ':BufferLinePick<cr>')

-- reindent
map('n', '<space>ri', 'gg=G<C-o>')
map('n', '<space>rp', ':PrettierPartial<cr>')
map('v', '<space>rp', ':PrettierPartial<cr>')

-- move left/right
-- map('n', '<right>', 'zL')
-- map('n', '<left>', 'zH')

-- toggle paste mode
map('n', '<space>P', ':set paste!<cr>')

-- replace text
map('n', '<leader>s', 'yiw:%s///gc<left><left><left><left><C-r>"<right>', {silent = false})

-- escape terminal
map('t', '<C-\\>', '<C-\\><C-n>', {silent = false})
-- map('t', '<C-k>', [[<C-\><C-n><C-W>k]], {silent = false})
-- map('t', '<C-j>', [[<C-\><C-n><C-W>j]], {silent = false})
-- map('t', '<C-l>', [[<C-\><C-n><C-W>l]], {silent = false})
-- map('t', '<C-h>', [[<C-\><C-n><C-W>h]], {silent = false})

-- remove trailing white space
map('n', '<space>rw', ':let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar>:nohl <Bar>:unlet _s <CR>', {silent = false })

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
-- surround.vim
--[[ vim.g.surround_no_mappings = 1
vim.g.surround_no_insert_mappings = 1
map('n', 'ds', '<Plug>Dsurround', {noremap = false, silent = true})
map('n', 'cs', '<Plug>Csurround', {noremap = false, silent = true})
map('n', 'cS', '<Plug>CSurround', {noremap = false, silent = true})
map('n', 'ys', '<Plug>Ysurround', {noremap = false, silent = true})
map('n', 'yS', '<Plug>YSurround', {noremap = false, silent = true})
map('x', 'gs', '<Plug>VSurround', {noremap = false, silent = true})
map('x', 'gS', '<Plug>VSurround', {noremap = false, silent = true}) ]]

-- ZenMode
map('n', '<space>z', ':ZenMode<cr>')

-- Telescope
map('n', '<space>F',  ':Telescope<cr>')
map('n', '<space>G',  ':Telescope live_grep<cr>')
map('n', '<space>ft', ':TodoTelescope<cr>')
map('n', '<space>fe', ':Telescope symbols<cr>')
map('n', '<space>ff', ':Telescope find_files<cr>')
map('n', '<space>fg', ':Telescope find_files cwd=~/GitHub<cr>')
map('n', '<space>fd', ':Telescope find_files cwd=~/dotfiles/<cr>')
map('n', '<space>fb', ':Telescope buffers<cr>')
map('n', '<space>fc', ':Telescope find_files cwd=~/dotfiles/dotfiles/.config/nvim/lua<cr>')

--- File Explorer
-- map('n', '<space>e', ':Neotree position=left toggle<CR>')
map('n', '<space>e', ":NvimTreeToggle<CR>")

-- gitsigns.nvim
map('n', '<leader>gh', '<cmd>Gitsigns preview_hunk<CR>')
map('n', '<leader>gn', '<cmd>Gitsigns next_hunk<CR>')
map('n', '<leader>gp', '<cmd>Gitsigns prev_hunk<CR>')
map('n', '<leader>gb', '<cmd>Gitsigns blame_line<CR>')
map('n', '<leader>gq', '<cmd>Gitsigns setqflist<CR>')

-- vim-easy-align
map('x', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = true})
map('n', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = true})

-- toggleterm.nvim
map('n', '<space>ag', ":lua _lazygit_toggle()<CR>")
map('n', '<space>ab', ":lua _bpytop_toggle()<CR>")
map('n', '<space>ap', ":lua _python_toggle()<CR>")
-- map('n', '<space>aj', ":lua _node_toggle()<CR>")

map('n', '<space>as', ":ToggleTermToggleAll<cr>")
map('n', '<space>aS', ":ToggleTerm direction=float<cr>")
map('n', '<space>aj', ":1ToggleTerm<cr>")
map('n', '<space>ak', ":2ToggleTerm<cr>")
map('n', '<space>al', ":3ToggleTerm<cr>")

-- vim-markdown
map('n', '<space>p', ":MarkdownPreviewToggle<cr>")

-- GNU boxes intergration
map('n', '<leader>v', ":lua Toggle_venn()<CR>" )

-- emmet-vim
g.user_emmet_leader_key = '<C-s>'

--------------------------------------------------------------------------------
--                                 Augroup                                    --
--------------------------------------------------------------------------------
vim.cmd([[
augroup WESLEYCH3N
  au!
  au BufWinEnter * silent! TSBufEnable rainbow
  au filetype html let b:AutoPairs = {"<": ">"}
  au filetype markdown setlocal wrap spell
  au BufReadPost * if line("'\"") > 2 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  " remove trailing white space
  au BufWritePre * %s/\s\+$//e
augroup END
]])

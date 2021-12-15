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

-- write/close file
function CloseBuf()
  local buf_count = vim.api.nvim_exec(
    'echo len(filter(range(1, bufnr(\'$\')), \'buflisted(v:val)\'))', true)
  vim.api.nvim_command(tonumber(buf_count)<=1 and 'q' or 'bd')
end
map('n', '<space>w', ':w<cr>')
map('n', '<space>q', ':lua CloseBuf()<cr>')

-- cd buf
map('n', '<space>c', ':cd %:p:h<cr>')
-- start/end word
map('n', '0', '^')
map('n', '9', '$')

-- nohlsearch
map('n', '<leader>n', ':let @/=""<cr>')

-- yank to system clipboard
map('v', '<leader>y', '"+y')

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

-- New/Close tab
map('n', '<C-t>', ':tabnew<cr>:Alpha<cr>')

-- retab
map('n', '<space>rt', ':retab<cr>')

-- reindent
map('n', '<space>ri', 'gg=G<C-o>')

-- move left/right
-- map('n', '<right>', 'zL')
-- map('n', '<left>', 'zH')

-- toggle paste mode
map('n', '<space>P', ':set paste!<cr>')

-- replace text
map('n', '<leader>s', ':%s//gc<left><left><left>', {silent = false})

-- escape terminal
map('t', '<C-\\>', '<C-\\><C-n>', {silent = false})
map('t', '<C-k>', [[<C-\><C-n><C-W>k]], {silent = false})

-- remove trailing white space
map('n', '<space>rw', ':let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar>:nohl <Bar>:unlet _s <CR>', {silent = false })

-- move line up/down in visual
map('v', 'K', ':m \'<-2<CR>gv=gv')
map('v', 'J', ':m \'>+1<CR>gv=gv')

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
-- symbols-outline.nvim
map('n', '<space>o', ':SymbolsOutline<CR>')

-- undotree
map('n', '<space>u', ':UndotreeToggle<CR>')

-- nvim-transparent
map('n', '<space>t', ':TransparentToggle<CR>')

-- ZenMode
map('n', '<space>z', ':lua require("zen-mode").toggle({window={width=.6}})<cr>')

-- Twilight
map('n', '<space>Z', ':Twilight<cr>')

-- Telescope
function _G.tlscp_opts(cwd)
  return {
    theme = "ivy",
    hidden = true,
    cwd = cwd,
    prompt_prefix = " ",
    layout_config = {
      height = 0.4,
      preview_width=0.6
    }}
end

map('n', '<space>F',
  ':lua require("telescope.builtin").builtin({prompt_prefix = " "})<cr>'
)
map('n', '<space>ff',
  ':lua require("telescope.builtin").find_files(tlscp_opts(""))<cr>'
)
map('n', '<space>fg',
  ':lua require("telescope.builtin").find_files(tlscp_opts("~/GitHub"))<cr>'
)
map('n', '<space>fc',
  ':lua require("telescope.builtin").find_files(tlscp_opts("~/dotfiles/dotfiles/.config/nvim/lua"))<cr>'
)
map('n', '<space>fd',
  ':lua require("telescope.builtin").find_files(tlscp_opts("~/dotfiles/"))<cr>'
)
map('n', '<space>fb',
  ':lua require("telescope.builtin").buffers()<cr>'
)
map('n', '<space>ft',
  ':TodoTelescope<cr>'
)

--- File Explorer
map('n', '<space>e', ':NvimTreeToggle<CR>')

-- gitsigns.nvim
map('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>')

-- vim-easy-align
map('x', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = true})
map('n', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = true})

-- nvim-repl
map('n', '<leader>r', ':ReplToggle<cr>')
map('n', '<leader>w', ':ReplSend<cr>')
map('v', '<leader>w', ':ReplSend<cr>')

-- hop.nvim
map('n', '<leader>f', ":HopWord<cr>")
map('n', '<leader>l', ":HopLineStart<cr>")
map('v', '<leader>f', "<cmd>HopWord<cr>")
map('v', '<leader>l', "<cmd>HopLineStart<cr>")

-- toggleterm.nvim
map('n', '<space>as', ":ToggleTerm<cr>")
map('n', '<space>ag', ":lua _lazygit_toggle()<CR>")
map('n', '<space>an', ":lua _nnn_toggle()<CR>")
map('n', '<space>ab', ":lua _bpytop_toggle()<CR>")
map('n', '<space>aj', ":lua _node_toggle()<CR>")
map('n', '<space>ap', ":lua _python_toggle()<CR>")

-- vim-markdown
map('n', '<space>p', ":MarkdownPreviewToggle<cr>")

-- GNU boxes intergration
map('v', '<space>bv', "!boxes -s 80 -a c -d vim-box<CR>")
map('v', '<space>bc', "!boxes -s 80 -a c -d cc<CR>")
map('v', '<space>bp', "!boxes -s 80 -a c -d shell<CR>")
map('v', '<space>bb', "!boxes -s 80 -a c -d ")

-- emmet-vim
g.user_emmet_leader_key = '<C-s>'

--------------------------------------------------------------------------------
--                                 Augroup                                    --
--------------------------------------------------------------------------------
vim.cmd([[
augroup myaucmd
  au filetype python setlocal define=^\\s*\\<\\(def\\\|class\\)\\>
  au filetype python nnoremap gf [<C-D>
  au filetype html let b:AutoPairs = {"<": ">"}
  " au filetype go,lua,html,javascript,sh,zsh,javascriptreact,typescriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au filetype markdown setlocal wrap spell
augroup END
augroup WESLEYCH3N
  au!
  au BufReadPost * if line("'\"") > 2 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  " remove trailing white space
  au BufWritePre * %s/\s\+$//e

  au! FileType which_key
  au FileType which_key set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
  au BufWinEnter * silent! TSBufEnable rainbow
augroup END
]])

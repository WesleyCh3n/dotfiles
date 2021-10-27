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

-- no ESC
map('i', 'jk', '<Esc>')
map('i', 'kj', '<Esc>')
map('i', 'jj', '<Esc>')

-- tab completion (Tab/S-Tab/CR)
function _G.check_back_space()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
end
map('i', '<Tab>', 'pumvisible() ? "\\<C-N>" : v:lua.check_back_space() ? "\\<Tab>" : coc#refresh()', {expr = true})
map('i', '<C-j>', 'pumvisible() ? "\\<C-N>" : v:lua.check_back_space() ? "\\<Tab>" : coc#refresh()', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-P>" : "\\<C-H>"', {expr = true})
map('i', '<C-k>', 'pumvisible() ? "\\<C-P>" : "\\<C-H>"', {expr = true})
map('i', '<cr>', 'pumvisible() ? "\\<C-Y>" : "\\<CR>"', {expr = true})

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

-- start/end word
map('n', '0', '^')
map('n', '9', '$')

-- easy indent
map('n', '>', '>>')
map('n', '<', '<<')

-- nohlsearch
map('n', '<leader>n', ':let @/=""<cr>')

-- yank to system clipboard
map('v', '<leader>y', '"+y')

-- yank to end line
map('n', 'Y', 'y$')

-- Tab
map('n', '<space>1', ':BufferLineGoToBuffer 1<cr>')
map('n', '<space>2', ':BufferLineGoToBuffer 2<cr>')
map('n', '<space>3', ':BufferLineGoToBuffer 3<cr>')
map('n', '<space>4', ':BufferLineGoToBuffer 4<cr>')
map('n', '<space>5', ':BufferLineGoToBuffer 5<cr>')
map('n', '<space>6', ':BufferLineGoToBuffer 6<cr>')
map('n', '<space>7', ':BufferLineGoToBuffer 7<cr>')
map('n', '<space>8', ':BufferLineGoToBuffer 8<cr>')
map('n', '<space>9', ':BufferLineGoToBuffer 9<cr>')
-- New/Close tab
map('n', '<C-t>', ':tabnew<cr>:Dashboard<cr>')
map('n', '<C-x>', ':tabclose<cr>')
-- Move tab
map('n', '<leader>>', ':tabmove +<cr>')
map('n', '<leader><', ':tabmove -<cr>')

-- retab
map('n', '<space>rt', ':retab<cr>')

-- reindent
map('n', '<space>ri', 'gg=G<cr><C-o><C-o>')

-- move left/right
map('n', '<right>', '10zl')
map('n', '<left>', '10zh')

-- toggle paste mode
map('n', '<space>P', ':set paste!<cr>')

-- replace text
map('n', '<leader>s', ':%s//gc<left><left><left>', {silent = false})

-- escape terminal
map('t', '<C-\\>', '<C-\\><C-n>', {silent = false})

-- remove trailing white space
map('n', '<space>fw', ':let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar>:nohl <Bar>:unlet _s <CR>', {silent = false })

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
-- Telescope-config
if vim.fn.has('win32') == 1 then
  t_hidden = ''
  t_prefix = ''
else
  t_hidden = 'hidden=true'
  t_prefix = 'prompt_prefix=🔍'
end
map('n', '<space>ss', ':SessionSave<CR>')
map('n', '<space>sl', ':SessionLoad<CR>')

-- Goyo
map('n', '<space>g', ':Goyo<cr>')

-- Telescope
map('n', '<space>fo', ':Telescope oldfiles '..t_hidden..' '..t_prefix..'<CR>')
map('n', '<space>ff', ':Telescope find_files '..t_hidden..' '..t_prefix..'<CR>')
map('n', '<space>fc', ':Telescope colorscheme '..t_prefix..'<CR>')
map('n', '<space>fm', ':Telescope marks '..t_prefix..'<CR>')
map('n', '<space>fa', ':Telescope coc diagnostics<cr>')
map('n', '<space>fd', ':Telescope coc declarations<cr>')

-- coc-explorer
map('n', '<space>e', ':CocCommand explorer<cr>')
map('n', '<space>ae', ':CocCommand explorer --preset floating<cr>')
map('n', '<space>ac', ':CocCommand explorer --preset config<cr>')
map('n', '<space>aG', ':CocCommand explorer --preset github<cr>')

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
map('n', '<space>ag', "<cmd>lua _lazygit_toggle()<CR>")
map('n', '<space>an', "<cmd>lua _nnn_toggle()<CR>")
map('n', '<space>ab', "<cmd>lua _bpytop_toggle()<CR>")
map('n', '<space>aj', "<cmd>lua _node_toggle()<CR>")
map('n', '<space>ap', "<cmd>lua _python_toggle()<CR>")

-- vim-markdown
map('n', '<space>p', ":MarkdownPreviewToggle<cr>")

-- GNU boxes intergration
map('v', '<space>bv', "!boxes -s 80 -a c -d vim-box<CR>")
map('v', '<space>bc', "!boxes -s 80 -a c -d cc<CR>")
map('v', '<space>bp', "!boxes -s 80 -a c -d shell<CR>")
map('v', '<space>bb', "!boxes -s 80 -a c -d ")

-- emmet-vim
g.user_emmet_leader_key = '<C-s>'

-- vim-which-key
map('n', '<Space>', ':WhichKey \'<Space>\'<CR>')
map('n', '<leader>', ':WhichKey \',\'<CR>')
map('v', '<Space>', ':WhichKeyVisual \'<Space>\'<CR>')
map('v', '<leader>', ':WhichKeyVisual \',\'<CR>')

--------------------------------------------------------------------------------
--                                 Augroup                                    --
--------------------------------------------------------------------------------
vim.cmd([[
augroup myaucmd
  " au filetype cpp,python nnoremap <silent> ,m :call RunCode()<cr> "
  au filetype python nnoremap <buffer> ,m :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
  au filetype python setlocal define=^\\s*\\<\\(def\\\|class\\)\\>
  au filetype python nnoremap gf [<C-D>
  au filetype html let b:AutoPairs = {"<": ">"}
  au filetype go,lua,html,javascript,sh,zsh,javascriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au filetype markdown setlocal wrap spell
augroup END
augroup WESLEYCH3N
  au!
  au bufwritepost *.lua source $MYVIMRC | call rainbow_main#load() | call rainbow_main#load()
  au FileType lua :cd ~/dotfiles

  au BufReadPost * if line("'\"") > 2 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  au BufWritePre * %s/\s\+$//e

  au FileType coc-explorer set winblend=10
  au FileType coc-explorer-border set winblend=10

  au BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport') | exe "norm! mzgg=G`z"

augroup END
]])

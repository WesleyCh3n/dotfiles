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
map('n', '<C-q>', ':Telescope coc diagnostics<cr>')

-- no EX mode
map('n', 'Q', '<NOP>')

-- write/close file
map('n', '<space>w', ':w<cr>')
map('n', '<space>q', ':q<cr>')

-- start/end word
map('n', '0', '^')
map('n', '9', '$')

-- easy indent
map('n', '>', '>>')
map('n', '<', '<<')

-- nohlsearch
map('n', '<leader>n', ':set hlsearch!<cr>')

-- yank to system clipboard
map('v', '<leader>y', '"+y')

-- yank to end line
map('n', 'Y', 'y$')

-- Tab
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')
map('n', '<leader>7', '7gt')
map('n', '<leader>8', '8gt')
map('n', '<leader>9', '9gt')
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
map('n', '<space>p', ':set paste!<cr>')

-- replace text
map('n', '<leader>s', ':%s//gc<left><left><left>', {silent = false})

-- escape terminal
map('t', '<C-\\>', '<C-\\><C-n>', {silent = false})

-- remove trailing white space
map('n', '<space>fw', ':let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar>:nohl <Bar>:unlet _s <CR>', {silent = false })

-- move line up/down in visual
map('v', 'K', ':m-2<CR>gv=gv')
map('v', 'J', ':m\'>+<CR>gv=gv')

-- apply q register in visual mode
map('v', '.', ':norm! @q<cr>')

--------------------------------------------------------------------------------
--                                  Plugin                                    --
--------------------------------------------------------------------------------
-- Dashboard
if vim.fn.has('win32') == 1 then
  t_hidden = ''
  t_prefix = ''
else
  t_hidden = 'hidden=true'
  t_prefix = 'prompt_prefix=🔍'
end
map('n', '<space>dh', ':Telescope oldfiles '..t_hidden..' '..t_prefix..' layout_config={"prompt_position":"top"}<CR>')
map('n', '<space>df', ':Telescope find_files '..t_hidden..' '..t_prefix..' layout_config={"prompt_position":"top"}<CR>')
map('n', '<space>dc', ':Telescope colorscheme '..t_prefix..' layout_config={"prompt_position":"top"}<CR>')
map('n', '<space>db', ':Telescope marks '..t_prefix..' layout_config={"prompt_position":"top"}<CR>')
map('n', '<space>dw', ':DashboardFindWord<CR>')
map('n', '<space>dn', ':DashboardNewFile<CR>')
map('n', '<space>ss', ':SessionSave<CR>')
map('n', '<space>sl', ':SessionLoad<CR>')

-- Goyo
map('n', '<space>g', ':Goyo<cr>')

-- coc-explorer
map('n', '<space>e', ':CocCommand explorer<cr>')
map('n', '<space>E', ':CocCommand explorer --preset floating<cr>')
map('n', '<space>ac', ':CocCommand explorer --preset config<cr>')
map('n', '<space>fg', ':CocCommand explorer --preset github<cr>')

-- vim-easy-align
map('x', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = true})
map('n', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = true})

-- nvim-repl
map('n', '<leader>r', ':ReplToggle<cr>')
map('n', '<leader>w', ':ReplSend<cr>')
map('v', '<leader>w', ':ReplSend<cr>')

-- hop.nvim
map('n', '<leader>f', ":lua require'hop'.hint_words()<cr>")
map('n', '<leader>l', ":lua require'hop'.hint_lines()<cr>")

-- vim-floaterm
vim.g.floaterm_keymap_toggle = '<space>at'
vim.g.floaterm_keymap_prev   = '<space>fp'
vim.g.floaterm_keymap_next   = '<space>fn'
map('n', '<space>as', ":FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1<cr>")
map('n', '<space>ag', ":FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 lazygit <cr>")
map('n', '<space>ad', ":FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 lazydocker <cr>")
map('n', '<space>an', ":FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 nnn <cr>")
map('n', '<space>ab', ":FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 bpytop <cr>")

-- vim-markdown
map('n', '<leader>p', ":MarkdownPreviewToggle<cr>")

-- GNU boxes intergration
map('v', '<space>bv', "!boxes -s 80 -a c -d vim-box<CR>")
map('v', '<space>bc', "!boxes -s 80 -a c -d cc<CR>")
map('v', '<space>bp', "!boxes -s 80 -a c -d shell<CR>")
map('v', '<space>bb', "!boxes -s 80 -a c -d ")

--------------------------------------------------------------------------------
--                                 Augroup                                    --
--------------------------------------------------------------------------------
vim.cmd([[
augroup myaucmd
    " au filetype cpp,python nnoremap <silent> ,m :call RunCode()<cr> "
    au filetype python nnoremap <buffer> ,m :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
    au filetype go nnoremap ,m :w<bar>:GoRun<space>%<cr>
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    au filetype tex setl updatetime=1000
    au filetype python setlocal define=^\\s*\\<\\(def\\\|class\\)\\>
    au filetype python nnoremap gf [<C-D>
    au filetype html let b:AutoPairs = {"<": ">"}
    au filetype lua,html,javascript,sh,zsh setlocal tabstop=2 softtabstop=2 shiftwidth=2
    au filetype md setlocal wrap spell
augroup END
augroup source_vimrc
    au!
    au bufwritepost *.lua source $MYVIMRC | AirlineRefresh | call rainbow_main#load() | call rainbow_main#load()
augroup END
]])

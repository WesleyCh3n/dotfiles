vim.g.mapleader = ','
--------------------------------------------------------------------------------
--                                  Default                                   --
--------------------------------------------------------------------------------
-- no ESC
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- no EX mode
vim.api.nvim_set_keymap('n', 'Q', '<NOP>', { noremap = true, silent = true })

-- write/close file
vim.api.nvim_set_keymap('n', '<space>w', ':w<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>q', ':q<cr>', { noremap = true, silent = true })

-- start/end word
vim.api.nvim_set_keymap('n', '0', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '9', '$', { noremap = true, silent = true })

-- easy indent
vim.api.nvim_set_keymap('n', '>', '>>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<', '<<', { noremap = true, silent = true })

-- nohlsearch
vim.api.nvim_set_keymap('n', '<leader>n', ':set hlsearch!<cr>', { noremap = true, silent = true })

-- yank to system clipboard
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- yank to end line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })

-- Tab
vim.api.nvim_set_keymap('n', '<leader>1', '1gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', '2gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', '3gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', '4gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', '5gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>6', '6gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>7', '7gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>8', '8gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>9', '9gt', { noremap = true, silent = true })
-- New/Close tab
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<cr>:Dashboard<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', ':tabclose<cr>', { noremap = true, silent = true })
-- Move tab
vim.api.nvim_set_keymap('n', '<leader>>', ':tabmove +<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><', ':tabmove -<cr>', { noremap = true, silent = true })

-- retab
vim.api.nvim_set_keymap('n', '<space>rt', ':retab<cr>', { noremap = true, silent = true })

-- reindent
vim.api.nvim_set_keymap('n', '<space>ri', 'gg=G<cr><C-o><C-o>', { noremap = true, silent = true })

-- move left/right
vim.api.nvim_set_keymap('n', '<right>', '10zl', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<left>', '10zh', { noremap = true, silent = true })

-- toggle paste mode
vim.api.nvim_set_keymap('n', '<space>p', ':set paste!<cr>', { noremap = true, silent = true })

-- replace text
vim.api.nvim_set_keymap('n', '<leader>s', ':%s//gc<left><left><left>', { noremap = true, silent = false })

-- escape terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = false })

-- remove trailing white space
vim.api.nvim_set_keymap('n', '<space>fw', ':let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar>:nohl <Bar>:unlet _s <CR>', { noremap = true, silent = false })

-- move line up/down in visual
vim.api.nvim_set_keymap('v', 'K', ':m-2<CR>gv=gv', { noremap = true, silent = false })
vim.api.nvim_set_keymap('v', 'J', ':m\'>+<CR>gv=gv', { noremap = true, silent = false })

--------------------------------------------------------------------------------
--                                  Plugin                                    --
--------------------------------------------------------------------------------
-- Dashboard
vim.api.nvim_set_keymap('n', '<space>dh', ':DashboardFindHistory<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>df', ':Telescope find_files hidden=true prompt_prefix=🔍 layout_config={"prompt_position":"top"}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>dc', ':DashboardChangeColorscheme<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>dw', ':DashboardFindWord<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>db', ':DashboardJumpMark<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>dn', ':DashboardNewFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>ss', ':<C-u>SessionSave<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>sl', ':<C-u>SessionLoad<CR>', { noremap = true, silent = true })

-- Goyo
vim.api.nvim_set_keymap('n', '<space>g', ':Goyo<cr>', { noremap = true, silent = true })

-- coc-explorer
vim.api.nvim_set_keymap('n', '<space>e', ':CocCommand explorer<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>E', ':CocCommand explorer --preset floating<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>ac', ':CocCommand explorer --preset config<cr>', { noremap = true, silent = true })

-- vim-easy-align
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

-- nvim-repl
vim.api.nvim_set_keymap('n', '<leader>r', ':ReplToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':ReplSend<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>w', ':ReplSend<cr>', { silent = true })

-- hop.nvim
vim.api.nvim_set_keymap('n', '<leader>f', ":lua require'hop'.hint_words()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ":lua require'hop'.hint_lines()<cr>", { noremap = true, silent = true })

-- vim-floaterm
vim.g.floaterm_keymap_toggle = '<space>at'
vim.g.floaterm_keymap_prev   = '<space>fp'
vim.g.floaterm_keymap_next   = '<space>fn'
vim.api.nvim_set_keymap('n', '<space>as', ":FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>ag', ":FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 lazygit <cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>ad', ":FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 lazydocker <cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>an', ":FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 nnn <cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>ab', ":FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 bpytop <cr>", { noremap = true, silent = true })

-- vim-markdown
vim.api.nvim_set_keymap('n', '<leader>p', ":MarkdownPreviewToggle<cr>", { noremap = true, silent = true })

-- GNU boxes intergration
vim.api.nvim_set_keymap('v', '<space>bv', "!boxes -s 80 -a c -d vim-box<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<space>bc', "!boxes -s 80 -a c -d cc<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<space>bp', "!boxes -s 80 -a c -d shell<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<space>bb', "!boxes -s 80 -a c -d ", { noremap = true, silent = true })

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
    au filetype html,javascript,sh,zsh setlocal tabstop=2 softtabstop=2 shiftwidth=2
    au filetype md setlocal wrap spell
augroup END
augroup source_vimrc
    au!
    au bufwritepost *.lua source $MYVIMRC | AirlineRefresh | call rainbow_main#load() | call rainbow_main#load()
augroup END
]])

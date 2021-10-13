--------------------------------------------------------------------------------
--                                  Helper                                    --
--------------------------------------------------------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

--------------------------------------------------------------------------------
--                                  Option                                    --
--------------------------------------------------------------------------------
cmd('silent! colorscheme gruvbox-material')
opt.background = 'dark'
opt.syntax = 'enable'
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.ruler = true
opt.confirm = true
opt.history = 200
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.spr = true
opt.sb = true
opt.timeout = true
opt.timeoutlen = 1000
opt.ttimeoutlen = 0
opt.swapfile = false
opt.mouse = 'a'
opt.showmatch = true
opt.ignorecase = true
opt.wrap = false
opt.path = '.,**'
opt.foldenable = false
opt.list = true
opt.listchars = 'tab:•\\ ,trail:█,extends:»,precedes:«'
opt.termguicolors = true
opt.colorcolumn = '80'
opt.guifont = 'MesloLGS NF:h20'
opt.autochdir = true
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.shortmess = 'c'
--[[
   [ " set Vim-specific sequences for RGB colors
   [ let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   [ let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
   [
   [ " Cursor shape
   [ let &t_SI = "\<Esc>[6 q"
   [ let &t_SR = "\<Esc>[4 q"
   [ let &t_EI = "\<Esc>[2 q"
   ]]

--------------------------------------------------------------------------------
--                              Colorscheme                                   --
--------------------------------------------------------------------------------
g.gruvbox_material_background = 'medium'
g.gruvbox_material_disable_italic_comment = 1
g.gruvbox_material_transparent_background = 0

g.airline_theme = 'gruvbox_material'
g.airline_left_sep = ''
g.airline_left_alt_sep = ''
g.airline_right_sep = ''
g.airline_right_alt_sep = ''
if vim.api.nvim_eval('!exists("g:airline_symbols")') then
  cmd([[let g:airline_symbols = {}]])
end
cmd('let g:airline_symbols.maxlinenr = \'\'')
cmd('let g:airline_symbols.linenr = \' ㏑\'')
cmd('let g:airline_symbols.colnr = \' ¶:\'')
g['airline#extensions#tmuxline#enabled'] = 0
g['airline#extensions#tabline#left_sep'] = ''
g['airline#extensions#tabline#left_alt_sep'] = ''
g['airline#extensions#tabline#right_sep'] = ''
g['airline#extensions#tabline#right_alt_sep'] = ''
g['airline#extensions#tabline#enabled'] = 1
g['airline#extensions#tabline#show_buffers'] = 0
g['airline#extensions#tabline#show_splits'] = 0
g['airline#extensions#tabline#show_tabs'] = 1
g['airline#extensions#tabline#show_tab_nr'] = 0
g['airline#extensions#tabline#show_tab_type'] = 0
g['airline#extensions#tabline#close_symbol'] = ''
g['airline#extensions#tabline#show_close_button'] = 1

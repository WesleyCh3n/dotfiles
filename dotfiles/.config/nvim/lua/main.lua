vim.api.nvim_command('syntax enable')
vim.api.nvim_command('set smartindent')
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set softtabstop=4')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set ruler')
vim.api.nvim_command('set confirm')
vim.api.nvim_command('set history=200')
vim.api.nvim_command('set cursorline')
vim.api.nvim_command('set number')
vim.api.nvim_command('set relativenumber')
vim.api.nvim_command('set spr')
vim.api.nvim_command('set sb')
vim.api.nvim_command('set timeout timeoutlen=1000 ttimeoutlen=0')
vim.api.nvim_command('set noswapfile')
vim.api.nvim_command('set mouse=a')
vim.api.nvim_command('set fillchars+=vert:│')
vim.api.nvim_command('set showmatch')
vim.api.nvim_command('set ignorecase')
vim.api.nvim_command('set nowrap')
vim.api.nvim_command('set path=.,**')
vim.api.nvim_command('set nofoldenable')
vim.api.nvim_command('set list')
vim.api.nvim_command('set listchars=tab:•\\ ,trail:█,extends:»,precedes:«')
vim.api.nvim_command('set termguicolors')
vim.api.nvim_command('set colorcolumn=80')
vim.api.nvim_command('set guifont=MesloLGS-NF-Regular:h18')
vim.api.nvim_command('set autochdir')
vim.api.nvim_command('set hidden')
vim.api.nvim_command('set nobackup')
vim.api.nvim_command('set nowritebackup')
vim.api.nvim_command('set updatetime=300')
vim.api.nvim_command('set shortmess+=c')

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

-- "===================================="
-- "|          Colorscheme             |"
-- "===================================="
vim.api.nvim_command('set background=dark')
vim.api.nvim_command('colorscheme gruvbox-material')
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_transparent_background = 0

vim.g.airline_theme = 'gruvbox_material'
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
if vim.api.nvim_eval('!exists("g:airline_symbols")') then
    vim.cmd([[let g:airline_symbols = {}]])
end
vim.cmd('let g:airline_symbols.maxlinenr = \'\'')
vim.cmd('let g:airline_symbols.linenr = \' ㏑\'')
vim.cmd('let g:airline_symbols.colnr = \' ¶:\'')
vim.g['airline#extensions#tmuxline#enabled'] = 0
vim.g['airline#extensions#tabline#left_sep'] = ''
vim.g['airline#extensions#tabline#left_alt_sep'] = ''
vim.g['airline#extensions#tabline#right_sep'] = ''
vim.g['airline#extensions#tabline#right_alt_sep'] = ''
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#show_buffers'] = 0
vim.g['airline#extensions#tabline#show_splits'] = 0
vim.g['airline#extensions#tabline#show_tabs'] = 1
vim.g['airline#extensions#tabline#show_tab_nr'] = 0
vim.g['airline#extensions#tabline#show_tab_type'] = 0
vim.g['airline#extensions#tabline#close_symbol'] = ''
vim.g['airline#extensions#tabline#show_close_button'] = 1

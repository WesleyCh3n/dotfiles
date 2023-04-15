local opt = vim.opt

opt.syntax = 'enable'
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.ruler = true
opt.confirm = true
opt.history = 200
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.spr = true
opt.sb = true
opt.timeout = true
opt.timeoutlen = 250
opt.ttimeoutlen = 0
opt.swapfile = false
opt.mouse = 'a'
opt.showmatch = true
opt.ignorecase = true
opt.wrap = false
opt.path = '.,**'
opt.foldenable = false
opt.list = true
opt.listchars = 'tab:>·,trail:█,extends:»,precedes:«'
opt.termguicolors = true
opt.colorcolumn = '80'
opt.autochdir = false
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.shortmess = 'at'
opt.signcolumn = 'yes'
opt.showtabline = 1
opt.undofile = true
opt.pumblend = 10
opt.pumheight = 10
opt.cmdheight = 0
opt.shortmess = 'nocI'
vim.cmd [[ let &fcs='eob: ' ]]

-- no EX mode
vim.keymap.set('n', 'Q', '<NOP>')

-- start/end word
vim.keymap.set('i', '<C-A>', '<Home>')
vim.keymap.set('i', '<C-E>', '<End>')

-- yank to system clipboard
vim.keymap.set('v', '<C-c>', '"+y')

-- Keep cursor center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`z')

-- Undo break point
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', '!', '!<c-g>u')
vim.keymap.set('i', '?', '?<c-g>u')

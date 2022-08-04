--------------------------------------------------------------------------------
--                                  Helper                                    --
--------------------------------------------------------------------------------
local opt = vim.opt  -- to set options

--------------------------------------------------------------------------------
--                                  Option                                    --
--------------------------------------------------------------------------------
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
opt.guifont = 'VictorMono Nerd Font Mono:h24'
opt.autochdir = false
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.shortmess = 'at'
opt.signcolumn = 'yes'
opt.showtabline = 1
opt.undofile = true
vim.cmd[[
let &fcs='eob: '
]]

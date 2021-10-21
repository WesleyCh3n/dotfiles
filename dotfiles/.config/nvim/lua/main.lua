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
opt.timeoutlen = 500
opt.ttimeoutlen = 0
opt.swapfile = false
opt.mouse = 'a'
opt.showmatch = true
opt.ignorecase = true
opt.wrap = false
opt.path = '.,**'
opt.foldenable = false
opt.list = true
opt.listchars = 'tab:<->,trail:█,extends:»,precedes:«'
opt.termguicolors = true
opt.colorcolumn = '80'
opt.guifont = 'MesloLGS NF:h20'
opt.autochdir = true
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.shortmess = 'c'
opt.signcolumn = 'yes'
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
g.gruvbox_material_transparent_background = 1

g.tabline_show_bufnr = false
g.tabline_show_filename_only = true
local custom_gruvbox = require('lualine.themes.gruvbox_material')
custom_gruvbox.terminal.a.bg = '#689d6a'
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = custom_gruvbox,
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {{'mode', separator = { left = '' }, right_padding = 2}},
    lualine_b = {'branch'},
    lualine_c = {
      'filename',
      {
        'diagnostics',
        sources = { 'coc', 'ale' },
        color_error = '#E06C75',
        color_warn = '#E5C07B',
        color_info = '#ABB2BF'
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    -- lualine_c = { require'tabline'.tabline_buffers },
    -- lualine_x = { require'tabline'.tabline_tabs },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {}
}
require("bufferline").setup{
  options = {
    right_mouse_command = 'vert sbuffer %d',
    left_trunc_marker = '',
    right_trunc_marker = '',
    diagnostics = "coc",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
      return s
    end,
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  }
}

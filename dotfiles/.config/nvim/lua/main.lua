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
opt.listchars = 'tab:>·,trail:█,extends:»,precedes:«'
opt.termguicolors = true
opt.colorcolumn = '80'
opt.guifont = 'MesloLGS NF:h20'
opt.autochdir = true
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.shortmess = 'ac'
opt.signcolumn = 'yes'
opt.showtabline = 1

--------------------------------------------------------------------------------
--                              Colorscheme                                   --
--------------------------------------------------------------------------------
g.gruvbox_material_background = 'medium'
g.gruvbox_material_disable_italic_comment = 1
-- g.gruvbox_material_transparent_background = 1
g.gruvbox_material_current_word = 'grey background'

g.tabline_show_bufnr = false
g.tabline_show_filename_only = true
local my_theme = require('lualine.themes.gruvbox-material')
-- my_theme.terminal.a.fg = '#282828'
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = my_theme,
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    disabled_filetypes = {"coc-explorer"},
  },
  sections = {
    lualine_a = {
      {'mode', separator = { left = '', right = '' }, padding={left=1}},
    },
    lualine_b = { 'branch', },
    lualine_c = {
      {
        'diff',
        colored = true,
        symbols = {added = '+', modified = '~', removed = '-'}, -- changes diff symbols
        source = nil,
      },
      'filename',
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        diagnostics_color = {
          error = { fg='#e06c75' },
          warn  = { fg='#e5c07b' },
          info  = { fg='#83a598' },
          hint  = { fg='#83a598' },
        },
      },
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {
      {'location', separator = { left = '', right = '' }, padding={right=1}},
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
}

require("bufferline").setup{
  options = {
    left_trunc_marker = '',
    right_trunc_marker = '',
    left_mouse_command = "vertical sbuffer %d",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
      return s
    end,
    separator_style = "slant",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    show_close_icon = false,
    show_tab_indicators = false,
  },
  highlights = {
    fill = {
      guibg = "#3c3836"
    },
    separator_selected = {
      guifg = "#3c3836"
    },
    separator_visible = {
      guifg = "#3c3836"
    },
    separator = {
      guifg = "#3c3836"
    },
  },
}

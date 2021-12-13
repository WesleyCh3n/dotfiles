
local my_theme = require('lualine.themes.gruvbox-material')
-- my_theme.terminal.a.fg = '#282828'
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = my_theme,
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    disabled_filetypes = {"NvimTree", "Outline", "toggleterm"},
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

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

local colors = {
  fg1    = '#282828',
  color2 = '#504945',
  fg2    = '#ddc7a1',
  color3 = '#32302f',
  color4 = '#a89984',
  color5 = '#7daea3',
  color6 = '#a9b665',
  color7 = '#d8a657',
  color8 = '#d3869b',
  color9 = '#ea6962',
}

local gruvbox_theme = {
  normal = {
    a = { fg = colors.fg1, bg = colors.color4, gui = 'bold' },
    b = { fg = colors.fg2, bg = colors.color2 },
    c = { fg = colors.fg2, bg = 'NONE' },
  },
  command = { a = { fg = colors.fg1, bg = colors.color5, gui = 'bold' } },
  inactive = {
    a = { fg = colors.fg2, bg = colors.color2 },
    b = { fg = 'NONE', bg = 'NONE' },
  },
  insert = { a = { fg = colors.fg1, bg = colors.color6, gui = 'bold' } },
  replace = { a = { fg = colors.fg1, bg = colors.color7, gui = 'bold' } },
  terminal = { a = { fg = colors.fg1, bg = colors.color6, gui = 'bold' } },
  visual = { a = { fg = colors.fg1, bg = colors.color9, gui = 'bold' } },
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = gruvbox_theme,
    section_separators = {left = '', right = ''},
    component_separators = {left = '|', right = '|'},
    disabled_filetypes = {"NvimTree", "lspsagaoutline", "alpha"},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {{'mode', separator = {left = '', right = ''}}},
    lualine_b = {
      'branch',
      -- {'diff', symbols = {added = ' ', modified = ' ', removed = ' '}},
    },
    lualine_c = {
      'filename',
      {'diagnostics', sources={'nvim_lsp'},}
    },
    lualine_x = {
      'encoding',
      'fileformat',
      {'filetype', icon_only = true}
    },
    lualine_y = {'progress'},
    lualine_z = {{'location', separator = {left = '', right = ''}}},
  },
  inactive_sections = {
    lualine_a = {{'filename', separator = {left = '', right = ''}}},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

local set_hl = {}

local configuration = vim.fn['gruvbox_material#get_configuration']()
local c = vim.fn['gruvbox_material#get_palette'](configuration.background, configuration.foreground,
  configuration.colors_override)

local float_group = {
  NormalFloat = { fg = c.fg0[1], bg = c.bg1[1] },
  FloatBorder = { fg = c.bg1[1], bg = c.bg1[1] },

  ErrorFloat   = { fg = "#ea6962", bg = "NONE", blend = 0 },
  WarningFloat = { fg = "#d8a657", bg = "NONE", blend = 0 },
  InfoFloat    = { fg = "#7daea3", bg = "NONE", blend = 0 },
  HintFloat    = { fg = "#a9b665", bg = "NONE", blend = 0 },

  DiagnosticError = { fg = "#ea6962", bg = "NONE", blend = 0 },
  DiagnosticWarn  = { fg = "#d8a657", bg = "NONE", blend = 0 },
  DiagnosticInfo  = { fg = "#7daea3", bg = "NONE", blend = 0 },
  DiagnosticHint  = { fg = "#a9b665", bg = "NONE", blend = 0 },

  DiagnosticVirtualTextError = { link = 'ErrorFloat' },
  DiagnosticVirtualTextWarn  = { link = 'WarningFloat' },
  DiagnosticVirtualTextInfo  = { link = 'InfoFloat' },
  DiagnosticVirtualTextHint  = { link = 'HintFloat' },

  WhichKeyFloat  = { bg = c.bg_dim[1] },
  WhichKeyBorder = { fg = c.bg_dim[1], bg = c.bg_dim[1] },

  TelescopeNormal        = { bg = "#252525" },
  TelescopeBorder        = { fg = "#252525", bg = "#252525" },
  TelescopePromptCounter = { fg = c.fg0[1], bg = c.bg2[1] },
  TelescopePromptBorder  = { fg = c.bg2[1], bg = c.bg2[1] },
  TelescopePromptNormal  = { fg = c.fg0[1], bg = c.bg2[1] },
  TelescopePromptTitle   = { fg = c.bg2[1], bg = c.bg2[1] },

  TelescopePreviewCounter = { fg = c.fg0[1], bg = c.bg_dim[1] },
  TelescopePreviewBorder = { fg = c.bg_dim[1], bg = c.bg_dim[1] },
  TelescopePreviewNormal = { fg = c.fg0[1], bg = c.bg_dim[1] },
  TelescopePreviewTitle = { fg = c.bg_dim[1], bg = c.bg_dim[1] },

  TelescopeSelection = { link = "Visual" },

}

function set_hl.float()
  for group, spec in pairs(float_group) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

local cmp_groups = {
  PmenuSel = { bg = "#32302f", fg = "NONE", blend = 0 },
  Pmenu    = { fg = '#ddc7a1', bg = '#45403d', blend = 0 },

  CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true, italic = true },
  CmpItemAbbrMatch      = { fg = "#82AAFF", bg = "NONE", bold = true },
  CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
  CmpItemMenu           = { fg = "#C792EA", bg = "NONE" },

  CmpItemKindField    = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindEvent    = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindText     = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindEnum     = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindKeyword  = { fg = "#C3E88D", bg = "#9FBD73" },

  CmpItemKindConstant    = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindReference   = { fg = "#FFE082", bg = "#D4BB6C" },

  CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindStruct   = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindClass    = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindModule   = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },

  CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindFile     = { fg = "#C5CDD9", bg = "#7E8294" },

  CmpItemKindUnit    = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindFolder  = { fg = "#F5EBD9", bg = "#D4A959" },

  CmpItemKindMethod     = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindValue      = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },

  CmpItemKindInterface     = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindColor         = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
}

function set_hl.cmp()
  for group, spec in pairs(cmp_groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return set_hl

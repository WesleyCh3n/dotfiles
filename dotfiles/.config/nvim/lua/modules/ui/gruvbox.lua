vim.g.gruvbox_material_background             = 'medium'
vim.g.gruvbox_material_current_word           = 'grey background'
vim.g.gruvbox_material_transparent_background = 1
vim.cmd('silent! colorscheme gruvbox-material')

local float_group = {
  NormalFloat = { fg = "#ddc7a1", bg = "NONE", blend = 0 },
  FloatBorder = { fg = "#928374", bg = "NONE", blend = 0 },
  WhichKeyFloat = { bg = "NONE", ctermbg = "NONE" },

  ErrorFloat = { fg = "#ea6962", bg = "NONE", blend = 0 },
  WarningFloat = { fg = "#d8a657", bg = "NONE", blend = 0 },
  InfoFloat = { fg = "#7daea3", bg = "NONE", blend = 0 },
  HintFloat = { fg = "#a9b665", bg = "NONE", blend = 0 },

  DiagnosticError = { fg = "#ea6962", bg = "NONE", blend = 0 },
  DiagnosticWarn = { fg = "#d8a657", bg = "NONE", blend = 0 },
  DiagnosticInfo = { fg = "#7daea3", bg = "NONE", blend = 0 },
  DiagnosticHint = { fg = "#a9b665", bg = "NONE", blend = 0 },

  DiagnosticVirtualTextError = { link = 'ErrorFloat' },
  DiagnosticVirtualTextWarn = { link = 'WarningFloat' },
  DiagnosticVirtualTextInfo = { link = 'InfoFloat' },
  DiagnosticVirtualTextHint = { link = 'HintFloat' },
}

for group, spec in pairs(float_group) do
  vim.api.nvim_set_hl(0, group, spec)
end

local cmp_groups = {
  PmenuSel = { bg = "#32302f", fg = "NONE", blend = 10 },
  Pmenu = { fg = '#ddc7a1', bg = '#45403d', blend = 10 },

  CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true, italic = true },
  CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold = true },
  CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
  CmpItemMenu = { fg = "#C792EA", bg = "NONE" },

  CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },

  CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },

  CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },

  CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },

  CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },

  CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },

  CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
}

for group, spec in pairs(cmp_groups) do
  vim.api.nvim_set_hl(0, group, spec)
end

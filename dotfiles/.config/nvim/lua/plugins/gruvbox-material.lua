return {
  {
    'sainnhe/gruvbox-material',
    config = function()
      if vim.g.neovide == nil then
        vim.g.gruvbox_material_background             = 'medium'
        vim.g.gruvbox_material_current_word           = 'grey background'
        vim.g.gruvbox_material_enable_italic          = 1
        vim.g.gruvbox_material_enable_bold            = 1
        vim.g.gruvbox_material_better_performance     = 1
        vim.g.gruvbox_material_transparent_background = 1
        vim.cmd.colorscheme('gruvbox-material')
      end

      local gruv_conf = vim.fn['gruvbox_material#get_configuration']()
      local c = vim.fn['gruvbox_material#get_palette'](
        gruv_conf.background,
        gruv_conf.foreground,
        gruv_conf.colors_override
      )
      local float_group = {
        NormalFloat                = { fg = c.fg0[1], bg = "NONE" },
        FloatBorder                = { fg = c.fg0[1], bg = "NONE" },

        ErrorFloat                 = { fg = c.red[1], bg = "NONE", blend = 0 },
        WarningFloat               = { fg = c.yellow[1], bg = "NONE", blend = 0 },
        InfoFloat                  = { fg = c.aqua[1], bg = "NONE", blend = 0 },
        HintFloat                  = { fg = c.green[1], bg = "NONE", blend = 0 },

        DiagnosticError            = { link = 'ErrorFloat' },
        DiagnosticWarn             = { link = 'WarningFloat' },
        DiagnosticInfo             = { link = 'InfoFloat' },
        DiagnosticHint             = { link = 'HintFloat' },

        DiagnosticVirtualTextError = { link = 'ErrorFloat' },
        DiagnosticVirtualTextWarn  = { link = 'WarningFloat' },
        DiagnosticVirtualTextInfo  = { link = 'InfoFloat' },
        DiagnosticVirtualTextHint  = { link = 'HintFloat' },

        WhichKeyTitle              = { bold = true, fg = "#e78a4e", bg = "NONE" },
        WhichKeyNormal             = { fg = c.fg0[1], bg = "NONE" },
        WhichKeyFloat              = { bg = "NONE" },
        WhichKeyBorder             = { fg = c.fg0[1], bg = "NONE" },
      }
      local cmp_groups = {
        PmenuSel                 = { bg = "#32302f", fg = "NONE", blend = 0 },
        Pmenu                    = { fg = '#ddc7a1', bg = '#45403d', blend = 0 },

        CmpItemAbbrDeprecated    = { fg = "#7E8294", bg = "NONE", strikethrough = true, italic = true },
        CmpItemAbbrMatch         = { fg = "#82AAFF", bg = "NONE", bold = true },
        CmpItemAbbrMatchFuzzy    = { fg = "#82AAFF", bg = "NONE", bold = true },
        CmpItemMenu              = { fg = "#C792EA", bg = "NONE" },

        CmpItemKindField         = { fg = "#EED8DA", bg = "#B5585F" },
        CmpItemKindProperty      = { fg = "#EED8DA", bg = "#B5585F" },
        CmpItemKindEvent         = { fg = "#EED8DA", bg = "#B5585F" },
        CmpItemKindText          = { fg = "#C3E88D", bg = "#9FBD73" },
        CmpItemKindEnum          = { fg = "#C3E88D", bg = "#9FBD73" },
        CmpItemKindKeyword       = { fg = "#C3E88D", bg = "#9FBD73" },

        CmpItemKindConstant      = { fg = "#FFE082", bg = "#D4BB6C" },
        CmpItemKindConstructor   = { fg = "#FFE082", bg = "#D4BB6C" },
        CmpItemKindReference     = { fg = "#FFE082", bg = "#D4BB6C" },

        CmpItemKindFunction      = { fg = "#EADFF0", bg = "#A377BF" },
        CmpItemKindStruct        = { fg = "#EADFF0", bg = "#A377BF" },
        CmpItemKindClass         = { fg = "#EADFF0", bg = "#A377BF" },
        CmpItemKindModule        = { fg = "#EADFF0", bg = "#A377BF" },
        CmpItemKindOperator      = { fg = "#EADFF0", bg = "#A377BF" },

        CmpItemKindVariable      = { fg = "#C5CDD9", bg = "#7E8294" },
        CmpItemKindFile          = { fg = "#C5CDD9", bg = "#7E8294" },

        CmpItemKindUnit          = { fg = "#F5EBD9", bg = "#D4A959" },
        CmpItemKindSnippet       = { fg = "#F5EBD9", bg = "#D4A959" },
        CmpItemKindFolder        = { fg = "#F5EBD9", bg = "#D4A959" },

        CmpItemKindMethod        = { fg = "#DDE5F5", bg = "#6C8ED4" },
        CmpItemKindValue         = { fg = "#DDE5F5", bg = "#6C8ED4" },
        CmpItemKindEnumMember    = { fg = "#DDE5F5", bg = "#6C8ED4" },

        CmpItemKindInterface     = { fg = "#D8EEEB", bg = "#58B5A8" },
        CmpItemKindColor         = { fg = "#D8EEEB", bg = "#58B5A8" },
        CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
      }
      for group, spec in pairs(float_group) do
        vim.api.nvim_set_hl(0, group, spec)
      end
      for group, spec in pairs(cmp_groups) do
        vim.api.nvim_set_hl(0, group, spec)
      end
      vim.api.nvim_set_hl(0, "WinBar", { fg = "NONE", bg = "NONE" })
      vim.api.nvim_set_hl(0, "WinBarNC", { fg = "NONE", bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
    end
  }
}

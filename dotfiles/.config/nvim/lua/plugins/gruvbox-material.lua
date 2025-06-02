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
        PmenuSel                      = { bg = "#32302f", fg = "NONE", blend = 0 },
        Pmenu                         = { fg = '#ddc7a1', bg = '#45403d', blend = 0 },

        BlinkCmpItemAbbrDeprecated    = { fg = "#7E8294", bg = "NONE", strikethrough = true, italic = true },
        BlinkCmpItemAbbrMatch         = { fg = "#82AAFF", bg = "NONE", bold = true },
        BlinkCmpItemAbbrMatchFuzzy    = { fg = "#82AAFF", bg = "NONE", bold = true },
        BlinkCmpItemMenu              = { fg = "#C792EA", bg = "NONE" },

        BlinkCmpKindIconField         = { fg = "#EED8DA", bg = "#B5585F" },
        BlinkCmpKindIconProperty      = { fg = "#EED8DA", bg = "#B5585F" },
        BlinkCmpKindIconEvent         = { fg = "#EED8DA", bg = "#B5585F" },
        BlinkCmpKindIconText          = { fg = "#C3E88D", bg = "#9FBD73" },
        BlinkCmpKindIconEnum          = { fg = "#C3E88D", bg = "#9FBD73" },
        BlinkCmpKindIconKeyword       = { fg = "#C3E88D", bg = "#9FBD73" },

        BlinkCmpKindIconConstant      = { fg = "#FFE082", bg = "#D4BB6C" },
        BlinkCmpKindIconConstructor   = { fg = "#FFE082", bg = "#D4BB6C" },
        BlinkCmpKindIconReference     = { fg = "#FFE082", bg = "#D4BB6C" },

        BlinkCmpKindIconFunction      = { fg = "#EADFF0", bg = "#A377BF" },
        BlinkCmpKindIconStruct        = { fg = "#EADFF0", bg = "#A377BF" },
        BlinkCmpKindIconClass         = { fg = "#EADFF0", bg = "#A377BF" },
        BlinkCmpKindIconModule        = { fg = "#EADFF0", bg = "#A377BF" },
        BlinkCmpKindIconOperator      = { fg = "#EADFF0", bg = "#A377BF" },

        BlinkCmpKindIconVariable      = { fg = "#C5CDD9", bg = "#7E8294" },
        BlinkCmpKindIconFile          = { fg = "#C5CDD9", bg = "#7E8294" },

        BlinkCmpKindIconUnit          = { fg = "#F5EBD9", bg = "#D4A959" },
        BlinkCmpKindIconSnippet       = { fg = "#F5EBD9", bg = "#D4A959" },
        BlinkCmpKindIconFolder        = { fg = "#F5EBD9", bg = "#D4A959" },

        BlinkCmpKindIconMethod        = { fg = "#DDE5F5", bg = "#6C8ED4" },
        BlinkCmpKindIconValue         = { fg = "#DDE5F5", bg = "#6C8ED4" },
        BlinkCmpKindIconEnumMember    = { fg = "#DDE5F5", bg = "#6C8ED4" },

        BlinkCmpKindIconInterface     = { fg = "#D8EEEB", bg = "#58B5A8" },
        BlinkCmpKindIconColor         = { fg = "#D8EEEB", bg = "#58B5A8" },
        BlinkCmpKindIconTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
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

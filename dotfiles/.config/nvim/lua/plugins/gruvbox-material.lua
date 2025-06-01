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
        PmenuSel = { bg = "#32302f", fg = "NONE", blend = 0 },
        Pmenu    = { fg = '#ddc7a1', bg = '#45403d', blend = 0 },

        -- BlinkCmpItemAbbrDeprecated    = { fg = "#7E8294", bg = "NONE", strikethrough = true, italic = true },
        -- BlinkCmpItemAbbrMatch         = { fg = "#82AAFF", bg = "NONE", bold = true },
        -- BlinkCmpItemAbbrMatchFuzzy    = { fg = "#82AAFF", bg = "NONE", bold = true },
        -- BlinkCmpItemMenu              = { fg = "#C792EA", bg = "NONE" },
        --
        -- BlinkCmpItemKindField         = { fg = "#EED8DA", bg = "#B5585F" },
        -- BlinkCmpItemKindProperty      = { fg = "#EED8DA", bg = "#B5585F" },
        -- BlinkCmpItemKindEvent         = { fg = "#EED8DA", bg = "#B5585F" },
        -- BlinkCmpItemKindText          = { fg = "#C3E88D", bg = "#9FBD73" },
        -- BlinkCmpItemKindEnum          = { fg = "#C3E88D", bg = "#9FBD73" },
        -- BlinkCmpItemKindKeyword       = { fg = "#C3E88D", bg = "#9FBD73" },
        --
        -- BlinkCmpItemKindConstant      = { fg = "#FFE082", bg = "#D4BB6C" },
        -- BlinkCmpItemKindConstructor   = { fg = "#FFE082", bg = "#D4BB6C" },
        -- BlinkCmpItemKindReference     = { fg = "#FFE082", bg = "#D4BB6C" },
        --
        -- BlinkCmpItemKindFunction      = { fg = "#EADFF0", bg = "#A377BF" },
        -- BlinkCmpItemKindStruct        = { fg = "#EADFF0", bg = "#A377BF" },
        -- BlinkCmpItemKindClass         = { fg = "#EADFF0", bg = "#A377BF" },
        -- BlinkCmpItemKindModule        = { fg = "#EADFF0", bg = "#A377BF" },
        -- BlinkCmpItemKindOperator      = { fg = "#EADFF0", bg = "#A377BF" },
        --
        -- BlinkCmpItemKindVariable      = { fg = "#C5CDD9", bg = "#7E8294" },
        -- BlinkCmpItemKindFile          = { fg = "#C5CDD9", bg = "#7E8294" },
        --
        -- BlinkCmpItemKindUnit          = { fg = "#F5EBD9", bg = "#D4A959" },
        -- BlinkCmpItemKindSnippet       = { fg = "#F5EBD9", bg = "#D4A959" },
        -- BlinkCmpItemKindFolder        = { fg = "#F5EBD9", bg = "#D4A959" },
        --
        -- BlinkCmpItemKindMethod        = { fg = "#DDE5F5", bg = "#6C8ED4" },
        -- BlinkCmpItemKindValue         = { fg = "#DDE5F5", bg = "#6C8ED4" },
        -- BlinkCmpItemKindEnumMember    = { fg = "#DDE5F5", bg = "#6C8ED4" },
        --
        -- BlinkCmpItemKindInterface     = { fg = "#D8EEEB", bg = "#58B5A8" },
        -- BlinkCmpItemKindColor         = { fg = "#D8EEEB", bg = "#58B5A8" },
        -- BlinkCmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
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

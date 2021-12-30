local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")

local function insert_left(element)
  table.insert(gls.left, element)
end

local function insert_right(element)
  table.insert(gls.right, element)
end

local colors = {
  sec_a_bg   = '#a89984',
  sec_b_bg   = '#504945',
  sec_c_bg   = 'NONE',
  fg         = '#ddc7a1',
  bg         = '#3c3836',
  red        = "#ea6962",
  darkred    = "#9d0006",
  orange     = "#e78a4e",
  darkorange = "#af3a03",
  yellow     = "#d8a657",
  green      = "#a9b665",
  aqua       = "#89b482",
  blue       = "#7daea3",
  light_blue = "#8fbcbb",
  purple     = "#d3869b",
  cyan       = "#458588",
}

insert_left {
  LeftStart = {
    provider = function() return '' end,
    highlight = {colors.sec_a_bg, 'NONE', 'NONE'}
  }
}

insert_left {
  ViMode = {
    icon = function()
      local icons = {
        n      = '  ',
        i      = '  ',
        c      = ' ﲵ ',
        V      = '  ',
        [''] = '  ',
        v      = '  ',
        C      = ' ﲵ ',
        R      = ' ﯒ ',
        t      = '  ',
      }
      return icons[vim.fn.mode()]
    end,
    provider = function()
      -- auto change color according the vim mode
      local alias = {
        n      = 'N',
        i      = 'I',
        c      = 'C',
        V      = 'VL',
        [''] = 'V',
        v      = 'V',
        C      = 'C',
        ['r?'] = ':CONFIRM',
        rm     = '--MORE',
        R      = 'R',
        Rv     = 'R&V',
        s      = 'S',
        S      = 'S',
        ['r']  = 'HIT-ENTER',
        [''] = 'SELECT',
        t      = 'T',
        ['!']  = 'SH',
      }
      local mode_color = {
        n      = colors.bg,
        i      = colors.cyan,
        v      = colors.darkred,
        [''] = colors.darkred,
        V      = colors.darkred,
        c      = colors.darkred,
        no     = colors.red,
        s      = colors.darkorange,
        S      = colors.darkorange,
        [''] = colors.darkorange,
        R      = colors.darkorange,
        Rv     = colors.darkorange,
        ic     = colors.yellow,
        cv     = colors.red,
        ce     = colors.red,
        r      = colors.cyan,
        rm     = colors.cyan,
        ['r?'] = colors.cyan,
        ['!']  = colors.red,
        t      = colors.red
      }

      local vim_mode = vim.fn.mode()
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
      return alias[vim_mode] .. " "
    end,
    highlight = {colors.sec_a_bg, colors.sec_a_bg, 'bold'},
  },
}

insert_left {
  Separa = {
    provider = function() return ' ' end,
    highlight = {colors.sec_a_bg, colors.sec_b_bg}
  }
}

insert_left {
  GitIcon = {
    provider = function() return " שׂ " end,
    condition = condition.check_git_workspace,
    separator = "",
    highlight = {colors.orange, colors.sec_b_bg},
  }
}

insert_left {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.light_blue, colors.sec_b_bg, 'bold'},
  }
}

insert_left {
  Space = {
    provider = function () return ' ' end,
    highlight = {colors.sec_b_bg, colors.sec_b_bg}
  }
}

insert_left {
  DiffAdd = {
    provider = "DiffAdd",
    icon = "  ",
    highlight = {colors.green, colors.sec_b_bg},
  },
}

insert_left {
  DiffModified = {
    provider = "DiffModified",
    icon = "  ",
    highlight = {colors.blue, colors.sec_b_bg},
  },
}

insert_left {
  DiffRemove = {
    provider = "DiffRemove",
    icon = "  ",
    highlight = {colors.red, colors.sec_b_bg},
    separator = ' ',
    separator_highlight = {colors.sec_b_bg, colors.sec_c_bg, colors.sec_c_bg},
  },
}

insert_left{
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {
      require('galaxyline.provider_fileinfo').get_file_icon_color,
      colors.sec_c_bg
    },
  },
}

insert_left{
  FileName = {
    provider = "FileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.sec_c_bg}
  }
}

insert_left{
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = {colors.red, colors.sec_c_bg},
  },
}

insert_left{
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = {colors.yellow, colors.sec_c_bg},
  },
}

insert_left{
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = "  ",
    highlight = {colors.green, colors.sec_c_bg},
  },
}

insert_left{
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",
    highlight = {colors.blue, colors.sec_c_bg},
  },
}

-- right
insert_right{
  FileFormat = {
    provider = function()
      local icons = {
        unix = " ",
        dos = " ",
        mac = " "
      }
      return icons[vim.bo.ff]
    end,
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.sec_c_bg, 'bold'},
  },
}

insert_right{
  Encoding = {
    provider = function()
      return vim.bo.fileencoding
    end,
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.sec_c_bg},
  },
}

insert_right{
  LinePercent = {
    provider = 'LinePercent',
    condition = buffer_not_empty,
    icon = "ﱒ",
    highlight = {colors.fg, colors.sec_b_bg},
    separator = " ",
    separator_highlight = {colors.sec_b_bg, colors.sec_c_bg},
  },
}

insert_right{
  LineInfo = {
    provider = 'LineColumn',
    icon = "﬿ ",
    highlight = {colors.bg, colors.sec_a_bg, 'bold'},
    separator = "",
    separator_highlight = {colors.sec_a_bg, colors.sec_b_bg},
  },
}
insert_right{
  RightEnd = {
    provider = function() return '' end,
    highlight = {colors.sec_a_bg, 'NONE', 'NONE'},
  }
}

gl.short_line_list = {
  '',
  'qf',
  'dbui',
  'DiffviewFileHistoryPanel',
  'DiffviewFiles',
  'alpha',
  'man',
  'term',
  'Packer',
  'NvimTree',
  'Help',
  'diff',
  'undotree',
  'netrw',
  'plug',
  'Outline',
  'quickfix',
  'toggleterm'
}

require ('galaxyline').section.short_line_left = {
  {
    LeftStart = {
      provider = function() return '' end,
      highlight = {colors.sec_a_bg, 'NONE', 'NONE'}
    },
  },
  {
    ShortLineLeftBufferType = {
      provider = function ()
        local BufferTypeMap = {
          ['NvimTree']   = ' Tree',
          ['help']       = ' Help',
          ['qf']         = ' Quick Fix',
          ['toggleterm'] = ' Terminal',
          ['FTerm']      = ' Terminal',
          ['Outline']    = ' Outline',
          ['Packer']     = ' Packer',
          ['undotree']   = ' Undotree',
        }
        local name = BufferTypeMap[vim.bo.filetype] or ' Editor'
        return string.format('  %s', name)
      end,
      highlight = {colors.bg, colors.sec_a_bg},
      separator = ' ',
      separator_highlight = {colors.sec_a_bg, colors.sec_b_bg}
    }
  },
  {
    ShortLineLeftWindowNumber = {
      provider = function()
        return ' ' .. vim.api.nvim_win_get_number(vim.api.nvim_get_current_win())
      end,
      highlight = {colors.light_blue, colors.sec_b_bg},
      separator = '',
      separator_highlight = {colors.sec_b_bg, colors.sec_c_bg}
    }
  }
}

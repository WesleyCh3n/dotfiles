--------------------------------------------------------------------------------
--                                  Helper                                    --
--------------------------------------------------------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- firenvim
if g.started_by_firenvim ~= nil then
  opt.guifont = 'MesloLGS NF:h10'
  opt.laststatus = 0
  opt.shortmess = 'at'
end

-- nvim-transparent
require("transparent").setup({
  enable = true,
  extra_groups = {
  },
  exclude = {}, -- table: groups you don't want to clear
})

-- hop.nvim
require('hop').setup()

-- vim-go
g.go_def_mapping_enabled = 0
g.go_doc_popup_window = 1
g.go_highlight_types = 1
g.go_highlight_fields = 1
g.go_highlight_functions = 1
g.go_highlight_function_calls = 1
g.go_highlight_extra_types = 1
g.go_highlight_operators = 1

-- better_escape
require("better_escape").setup {
    mapping = {"jk", "jj", "kj"},
}
-- indent-blankline
require("indent_blankline").setup {
  buftype_exclude = {"terminal", "help"}
}

-- Telescope
require('telescope').load_extension('repo')
require('telescope').load_extension('coc')
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    layout_config = {
      horizontal = {
       preview_width = 0.6,
      },
    },
    mappings = {
      n = {
        ["<CR>"] = actions.select_tab,
      },
      i = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_tab,
      },
    },
    file_ignore_patterns = {
      "node_modules/*",
      ".git/*"
    }
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "ivy",
      mappings = {
        n = {
          ["dd"] = "delete_buffer",
        }
      }
    }
  },
}

-- nnn.nvim
local builtin = require("nnn").builtin
require("nnn").setup({
  explorer = {
    width = 35,
  },
  picker = {
    style = { border = "rounded" },
  },
  auto_close = true,
  replace_netrw = "picker",
  tabs = false,
  mappings = {
		{ "<C-t>", builtin.open_in_tab },       -- open file(s) in tab
		{ "<C-s>", builtin.open_in_split },     -- open file(s) in split
		{ "<C-v>", builtin.open_in_vsplit },    -- open file(s) in vertical split
		{ "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
		{ "<C-w>", builtin.cd_to_path },        -- cd to file directory
		{ "<C-e>", builtin.populate_cmdline },  -- populate cmdline (:) with file(s)
	}
})

local wk = require("which-key")
wk.register({
  ['#'] = 'ﴵ tab #[123]',
  ['1'] = 'which_key_ignore',
  ['2'] = 'which_key_ignore',
  ['3'] = 'which_key_ignore',
  ['4'] = 'which_key_ignore',
  ['5'] = 'which_key_ignore',
  ['6'] = 'which_key_ignore',
  ['7'] = 'which_key_ignore',
  ['8'] = 'which_key_ignore',
  ['9'] = 'which_key_ignore',
  a = {
    name = ' float',
    s = 'shell',
    g = 'lazygit',
    d = 'lazydocker',
    b = 'bpytop',
    n = 'nnn file explorer',
    j = 'node',
    p = 'python',
  },
  b = { name = ' boxes' },
  c = 'which_key_ignore',
  d = { name = 'which_key_ignore' },
  e = ' nnn',
  f = {
    name = ' telescope',
    b = 'list buffers',
    c = 'nvimrc',
    d = 'dotfile',
    f = 'find files',
    g = 'GitHub',
    w = 'rm trailing white',
  },
  p = ' md preview',
  P = ' toggle paste',
  q = ' quit',
  r = {
    name = '漏re-',
    i = 're-Indent',
    t = 're-Tab',
    n = 'rename variable'
  },
  s = { name = 'which_key_ignore' },
  t = ' toggle bg',
  w = ' write',
  z = ' zen',
}, { prefix = "<space>" })

wk.register({
  g = {
    a = 'show diagnostics',
    d = 'show definitions',
    r = 'show reference',
  }
})

local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
[[                               __                ]],
[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
dashboard.button( "e", "  New file" , ':ene <BAR> startinsert <CR>'),
dashboard.button( "f", "  Telescope" , ':lua require("telescope.builtin").find_files(tlscp_opts(""))<cr>'),
dashboard.button( "q", "  Quit NVIM" , ':qa<CR>'),
}
dashboard.section.footer.val = require('alpha.fortune')()
alpha.setup(dashboard.opts)

g.indent_blankline_filetype_exclude  = {'alpha', }

-- auto-pairs
g.AutoPairsShortcutJump = '<S-tab>'

-- python-syntax
g.python_highlight_all = 1

-- markdown-preview
g.mkdp_auto_close = 0

-- vim-markdown
g.vim_markdown_conceal = 0
g.vim_markdown_conceal_code_blocks = 0

-- SimpylFold
g.SimpylFold_fold_docstring = 0

-- tagbar
g.tagbar_width = 30

-- coc-snippets
g.UltiSnipsExpandTrigger="<C-l>"
g.UltiSnipsEditSplit="vertical"

-- nerd-commentor
g.NERDSpaceDelims = 1
g.NERDCustomDelimiters = {
    python = { left = '#', right = '' },
    dosbatch = { left = '::' }
}

-- nvim-repl
g.repl_filetype_commands = {
    javascript = 'node',
    python = 'python3',
}
g.repl_split = 'vertical'

-- toggleterm.nvim
require("toggleterm").setup{
  size=15,
  direction = 'float',
  float_opts = {
    border='curved'
  }
}
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = 'float', hidden = true, })
local nnn = Terminal:new({ cmd = "nnn", direction = 'float', hidden = true, })
local bpytop = Terminal:new({ cmd = "btop", direction = 'float', hidden = true, })
local node = Terminal:new({ cmd = "node", direction = 'float', hidden = true, })
local python = Terminal:new({ cmd = "python3", direction = 'float', hidden = true, })
function _lazygit_toggle() lazygit:toggle() end
function _nnn_toggle() nnn:toggle() end
function _bpytop_toggle() bpytop:toggle() end
function _node_toggle() node:toggle() end
function _python_toggle() python:toggle() end

-- rainbow
g.rainbow_active = 1
g.rainbow_conf = { separately = { cmake = 0, } }

g.coc_explorer_global_presets = {
  config = {
    ['position']= 'floating',
    ['root-uri']= DOTFILE_DIR..'lua',
  },
  floating= {
    ['position']= 'floating',
    ['open-action-strategy']= 'sourceWindow',
  },
  github = {
    ['position']= 'floating',
    ['root-uri']= '~/GitHub',
  },

}

vim.fn['coc#config']('suggest', {
  ['completionItemKindLabels']= {
    ["method"]        = "  ",
    ["function"]      = "  ",
    ["variable"]      = "  ",
    ["field"]         = " ﰠ ",
    ["typeParameter"] = "  ",
    ["constant"]      = "  ",
    ["class"]         = " ﴯ ",
    ["interface"]     = "  ",
    ["struct"]        = " פּ ",
    ["event"]         = "  ",
    ["operator"]      = "  ",
    ["module"]        = "  ",
    ["property"]      = " ﰠ ",
    ["enum"]          = "  ",
    ["reference"]     = "  ",
    ["keyword"]       = "  ",
    ["file"]          = "  ",
    ["folder"]        = " ﱮ ",
    ["color"]         = "  ",
    ["unit"]          = " 塞",
    ["snippet"]       = "  ",
    ["text"]          = "  ",
    ["constructor"]   = "  ",
    ["value"]         = "  ",
    ["enumMember"]    = "  "
  }
})

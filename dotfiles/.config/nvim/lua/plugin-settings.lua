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
      i = {
        ["<esc>"] = actions.close
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

-- vim-which-key
g.which_key_hspace = 1
fn['which_key#register'](',', 'g:which_key_leader')
g.which_key_leader = {
  ['c'] = { name = "+comment" },
  ['<'] = 'Move tab left',
  ['>'] = 'Move tab right',
  ['n'] = 'Clear search',
  ['s'] = 'Repace text',
}

fn['which_key#register']('<Space>', 'g:which_key_space')
g.which_key_space = {
  ['1'] = 'Tab 1',
  ['2'] = 'Tab 2',
  ['3'] = 'Tab 3',
  ['4'] = 'which_key_ignore',
  ['5'] = 'which_key_ignore',
  ['6'] = 'which_key_ignore',
  ['7'] = 'which_key_ignore',
  ['8'] = 'which_key_ignore',
  ['9'] = 'which_key_ignore',
  ['p'] = 'md preview',
  ['z'] = 'ZenMode',
  ['a'] = {
    name = '+float',
    ['s'] = 'Shell',
    ['g'] = 'lazygit',
    ['d'] = 'lazydocker',
    ['b'] = 'bpytop',
    ['n'] = 'nnn file explorer',
  },
  ['b'] = { name = 'boxes' },
  ['c'] = 'which_key_ignore',
  ['d'] = { name = 'which_key_ignore' },
  ['f'] = {
    name = '+Telescope',
    ['f'] = 'find files',
    ['o'] = 'find histories',
    ['m'] = 'find marks',
    ['a'] = 'show diagnostics',
    ['d'] = 'show definitions',
    ['i'] = 'show implementation',
    ['r'] = 'show reference',
    ['c'] = 'set colorscheme',
    ['b'] = 'list buffers',
    ['m'] = 'which_key_ignore',
    ['p'] = 'which_key_ignore',
    ['w'] = 'which_key_ignore',
  },
  ['r'] = {
    name = '+re-',
    ['i'] = 'Re-Indent',
    ['t'] = 'Re-Tab',
    ['n'] = 'Rename variable'
  },
  ['s'] = {
    name = '+session',
    ['s'] = 'Session Save',
    ['l'] = 'Session Load'
  },
  ['w'] = 'Write file',
  ['q'] = 'Quit file',
  ['P'] = 'Toggle paste',
  ['e'] = 'nnn',
}

-- Dashboard
g.indent_blankline_filetype_exclude  = {'dashboard', 'coc-explorer'}
g.dashboard_default_executive = 'telescope'
g.dashboard_custom_section={
['01_bookmarks'] = {
    ['description'] = {' Jump to bookmarks                     <space> f m'},
    ['command'] = 'Telescope marks prompt_prefix=🔍 layout_config={"prompt_position"="top"}'},
['02_fine_file'] = {
    ['description'] = {' Find file                             <space> f f'},
    ['command'] = 'Telescope find_files hidden=true prompt_prefix=🔍 layout_config={"prompt_position"="top"}'},
['03_recent_file'] = {
    ['description'] = {' Recently opened files                 <space> f o'},
    ['command'] = 'Telescope oldfiles hidden=true prompt_prefix=🔍 layout_config={"prompt_position"="top"}'},
['04_last_session'] = {
    ['description'] = {' Open last session                     <space> s l'},
    ['command'] = 'SessionLoad'},
['05_new_file'] = {
    ['description'] = {' New file                              <space> d n'},
    ['command'] = 'enew'},
}

g.dashboard_custom_header = {
  "    .,;'           :,.    ",
  "  .,;;;,,.         ccc;.  ",
  ".;c::::,,,'        ccccc: ",
  ".::cc::,,,,,.      cccccc.",
  ".cccccc;;;;;;'     llllll.",
  ".cccccc.,;;;;;;.   llllll.",
  ".cccccc  ';;;;;;'  oooooo.",
  "'lllllc   .;;;;;;;.oooooo'",
  "'lllllc     ,::::::looooo'",
  "'llllll      .:::::lloddd'",
  ".looool       .;::coooodo.",
  "  .cool         'ccoooc.  ",
  "    .co          .:o:.    ",
}

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

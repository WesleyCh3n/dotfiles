--------------------------------------------------------------------------------
--                                  Helper                                    --
--------------------------------------------------------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- indent-blankline
require("indent_blankline").setup {
  buftype_exclude = {"terminal", "help"}
}

-- Telescope
require('telescope').load_extension('coc')
--[[
   [ require('telescope').setup{
   [   defaults = {
   [     layout_config = {
   [       horizontal = {
   [         prompt_position = "top",
   [       }
   [     }
   [   }
   [ }
   ]]

-- vim-which-key
g.which_key_hspace = 1
fn['which_key#register'](',', 'g:which_key_leader')
g.which_key_leader = {
  ['c'] = { name = "+comment" },
  ['1'] = 'Tab 1',
  ['2'] = 'Tab 2',
  ['3'] = 'Tab 3',
  ['4'] = 'Tab 4',
  ['5'] = 'which_key_ignore',
  ['6'] = 'which_key_ignore',
  ['7'] = 'which_key_ignore',
  ['8'] = 'which_key_ignore',
  ['9'] = 'which_key_ignore',
  ['<'] = 'Move tab left',
  ['>'] = 'Move tab right',
  ['n'] = 'Clear search',
  ['s'] = 'Repace text',
}

fn['which_key#register']('<Space>', 'g:which_key_space')
g.which_key_space = {
  ['a'] = {
    name = '+float',
    ['s'] = 'Shell',
    ['c'] = 'MYVIMRC directory',
    ['g'] = 'lazygit',
    ['d'] = 'lazydocker',
    ['b'] = 'bpytop',
    ['e'] = 'coc file explorer',
    ['n'] = 'nnn file explorer',
    ['G'] = 'Open GitHub',
  },
  ['d'] = { name = 'which_key_ignore' },
  ['f'] = {
    name = '+Telescope',
    ['f'] = 'find files',
    ['o'] = 'find histories',
    ['m'] = 'find marks',
    ['a'] = 'show diagnostics',
    ['d'] = 'show definitions',
    ['c'] = 'set colorscheme',
    ['m'] = 'which_key_ignore',
    ['p'] = 'which_key_ignore',
    ['w'] = 'which_key_ignore',
  },
  ['r'] = {
    name = '+re-',
    ['i'] = 'Re-Indent',
    ['t'] = 'Re-Tab'
  },
  ['s'] = {
    name = '+session',
    ['s'] = 'Session Save',
    ['l'] = 'Session Load'
  },
  ['w'] = 'Write file',
  ['q'] = 'Quit file',
  ['e'] = 'File explorer',
  ['P'] = 'Toggle paste',
}

-- Dashboard
g.indent_blankline_filetype_exclude  = {'dashboard'}
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

g.dashboard_custom_header ={
  '⠀⠀⠀⠀⣠⣎⣀⣀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⠀⠀⠀⠀',
  '⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀',
  '⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡿⠏⠿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⡆⠀⠀',
  '⠀⠀⣿⣿⣿⣿⣿⣿⡿⢿⠋⠉⠀⠀⠀⠀⠀⡀⠀⠀⠘⢿⣿⣿⣿⣿⣧⠀⠀',
  '⠀⢰⣿⣿⣿⣿⠟⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⡈⠀⠻⣿⣿⣿⣿⠀⠀',
  '⠀⣼⣿⣿⡿⠁⠀⢸⠀⠈⢳⣶⣤⣄⠀⠈⠀⠁⠀⠀⠀⢀⠀⠹⣿⣿⡟⠀⠀',
  '⠀⣿⣿⣿⠀⠀⠈⣼⡇⠀⠘⠻⠟⠁⠀⠀⠀⠀⢤⣀⡀⠌⠀⠀⣿⣿⠃⠀⠀',
  '⠀⣿⣿⣿⡀⠀⠀⡏⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡿⠋⢰⢠⣿⡏⠀⠀⠀',
  '⠀⣿⣿⣿⡇⠀⠀⢷⡃⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣯⣾⡟⠀⠀⠀⠀',
  '⠀⣿⣿⣿⡿⠀⠀⣼⣿⡄⠀⠈⠀⢑⠶⠀⠀⠀⠀⢀⣾⣿⣿⣿⡇⠀⠀⠀⠀',
  '⠀⣿⣿⣿⠁⠀⠀⣿⣿⠁⠀⠀⠀⢀⣀⣠⣤⣤⣴⠟⣿⣿⣿⣿⡇⠀⠀⠀⠀',
  '⠀⠙⢿⠃⠀⠀⢸⣿⣟⠀⠀⢀⣤⣾⣿⣿⣿⠟⠁⢰⣿⣿⣿⣿⠃⠀⠀⠀⠀',
  '⠀⠠⠴⠀⠀⠀⠿⠿⠿⠧⠾⠿⠿⠿⠿⠿⠃⠀⠀⠾⠿⠿⠟⠁⠀    ',
}
g.dashboard_custom_header1 = {
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

-- Goyo
g.goyo_height = 95

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
  float_opts = {
    border='curved'
  }
}
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = 'float', hidden = true, })
local nnn = Terminal:new({ cmd = "nnn", direction = 'float', hidden = true, })
local bpytop = Terminal:new({ cmd = "bpytop", direction = 'float', hidden = true, })
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
    ['root-uri']= HOME_DIR..'lua',
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
    ["method"]        = "  ",
    ["function"]      = "  ",
    ["variable"]      = "[]",
    ["field"]         = "  ",
    ["typeParameter"] = "<>",
    ["constant"]      = "  ",
    ["class"]         = " פּ ",
    ["interface"]     = " 蘒",
    ["struct"]        = "  ",
    ["event"]         = "  ",
    ["operator"]      = "  ",
    ["module"]        = "  ",
    ["property"]      = "  ",
    ["enum"]          = " 練",
    ["reference"]     = "  ",
    ["keyword"]       = "  ",
    ["file"]          = "  ",
    ["folder"]        = " ﱮ ",
    ["color"]         = "  ",
    ["unit"]          = " 塞",
    ["snippet"]       = "  ",
    ["text"]          = "  ",
    ["constructor"]   = "  ",
    ["value"]         = "  ",
    ["enumMember"]    = "  "
  }
})

--[[
   [ ["keyword"]       = "\\uf1de",
   [ ["variable"]      = "\\ue79b",
   [ ["value"]         = "\\uf89f",
   [ ["operator"]      = "\\u03a8",
   [ ["constructor"]   = "\\uf0ad",
   [ ["function"]      = "\\u0192",
   [ ["reference"]     = "\\ufa46",
   [ ["constant"]      = "\\uf8fe",
   [ ["method"]        = "\\uf09a",
   [ ["struct"]        = "\\ufb44",
   [ ["class"]         = "\\uf0e8",
   [ ["interface"]     = "\\uf417",
   [ ["text"]          = "\\ue612",
   [ ["enum"]          = "\\uf435",
   [ ["enumMember"]    = "\\uf02b",
   [ ["module"]        = "\\uf40d",
   [ ["color"]         = "\\ue22b",
   [ ["property"]      = "\\ue624",
   [ ["field"]         = "\\uf9be",
   [ ["unit"]          = "\\uf475",
   [ ["event"]         = "\\ufacd",
   [ ["file"]          = "\\uf723",
   [ ["folder"]        = "\\uf114",
   [ ["snippet"]       = "",
   [ ["typeParameter"] = "\\uf728",
   [ ["default"]       = "\\uf29c"
   ]]

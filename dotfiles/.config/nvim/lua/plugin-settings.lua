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

-- Dashboard
g.indent_blankline_filetype_exclude  = {'dashboard'}
g.dashboard_default_executive = 'telescope'
g.dashboard_custom_section={
['01_bookmarks'] = {
    ['description'] = {' Jump to bookmarks                     <space> d b'},
    ['command'] = 'Telescope marks prompt_prefix=🔍 layout_config={"prompt_position"="top"}'},
['02_fine_file'] = {
    ['description'] = {' Find file                             <space> d f'},
    ['command'] = 'Telescope find_files hidden=true prompt_prefix=🔍 layout_config={"prompt_position"="top"}'},
['03_recent_file'] = {
    ['description'] = {' Recently opened files                 <space> d h'},
    ['command'] = 'Telescope oldfiles hidden=true prompt_prefix=🔍 layout_config={"prompt_position"="top"}'},
['04_last_session'] = {
    ['description'] = {' Open last session                     <space> s l'},
    ['command'] = 'SessionLoad'},
['05_new_file'] = {
    ['description'] = {' New file                              <space> d n'},
    ['command'] = 'DashboardNewFile'},
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

-- vim-floaterm
g.floaterm_opener = 'tabe'
g.floaterm_borderchars = {'═', '║', '═', '║', '╔', '╗', '╝', '╚'}

-- rainbow
g.rainbow_active = 1
g.rainbow_conf = { separately = { cmake = 0, } }

g.coc_explorer_global_presets = {
  config = {
    ['position']= 'floating',
    ['floating-width']= 120,
    ['root-uri']= HOME_DIR..'lua',
  },
  floating= {
    ['position']= 'floating',
    ['floating-width']= 120,
    ['open-action-strategy']= 'sourceWindow',
  },
  github = {
    ['position']= 'floating',
    ['floating-width']= 120,
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

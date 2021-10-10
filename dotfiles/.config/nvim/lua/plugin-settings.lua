-- Dashboard
vim.g.dashboard_default_executive = 'telescope'
vim.g.indentLine_fileTypeExclude  = 'dashboard'

-- auto-pairs
vim.g.AutoPairsShortcutJump = '<S-tab>'
-- Goyo
vim.g.goyo_height = 95

-- python-syntax
vim.g.python_highlight_all = 1

-- nerd-commentor
vim.g.NERDSpaceDelims = 1

-- markdown-preview
vim.g.mkdp_auto_close = 0

-- vim-markdown
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0

-- SimpylFold
vim.g.SimpylFold_fold_docstring = 0

-- tagbar
vim.g.tagbar_width = 30

-- coc-snippets
vim.g.UltiSnipsExpandTrigger="<C-l>"
vim.g.UltiSnipsEditSplit="vertical"

vim.cmd([[

" Dashboard "
let g:dashboard_custom_shortcut={
\ 'last_session'       : '<space> s l',
\ 'find_history'       : '<space> d h',
\ 'find_file'          : '<space> d f',
\ 'new_file'           : '<space> d n',
\ 'change_colorscheme' : '<space> d c',
\ 'find_word'          : '<space> d w',
\ 'book_marks'         : '<space> d b',
\ }

let g:dashboard_custom_header =[
    \'',
    \'⠀⠀⠀⠀⠀⠀⡀⠀⠀⣀⣀⣀⡀⠀⢀⡀⠀⢀⣀⣀⣀⠀⡀⠀⠀⠀⠀⠀⠀',
    \'⠀⠀⠀⠀⣠⣎⣀⣀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⠀⠀⠀⠀',
    \'⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀',
    \'⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡿⠏⠿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⡆⠀⠀',
    \'⠀⠀⣿⣿⣿⣿⣿⣿⡿⢿⠋⠉⠀⠀⠀⠀⠀⡀⠀⠀⠘⢿⣿⣿⣿⣿⣧⠀⠀',
    \'⠀⢰⣿⣿⣿⣿⠟⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⡈⠀⠻⣿⣿⣿⣿⠀⠀',
    \'⠀⣼⣿⣿⡿⠁⠀⢸⠀⠈⢳⣶⣤⣄⠀⠈⠀⠁⠀⠀⠀⢀⠀⠹⣿⣿⡟⠀⠀',
    \'⠀⣿⣿⣿⠀⠀⠈⣼⡇⠀⠘⠻⠟⠁⠀⠀⠀⠀⢤⣀⡀⠌⠀⠀⣿⣿⠃⠀⠀',
    \'⠀⣿⣿⣿⡀⠀⠀⡏⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡿⠋⢰⢠⣿⡏⠀⠀⠀',
    \'⠀⣿⣿⣿⡇⠀⠀⢷⡃⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣯⣾⡟⠀⠀⠀⠀',
    \'⠀⣿⣿⣿⡿⠀⠀⣼⣿⡄⠀⠈⠀⢑⠶⠀⠀⠀⠀⢀⣾⣿⣿⣿⡇⠀⠀⠀⠀',
    \'⠀⣿⣿⣿⠁⠀⠀⣿⣿⠁⠀⠀⠀⢀⣀⣠⣤⣤⣴⠟⣿⣿⣿⣿⡇⠀⠀⠀⠀',
    \'⠀⠙⢿⠃⠀⠀⢸⣿⣟⠀⠀⢀⣤⣾⣿⣿⣿⠟⠁⢰⣿⣿⣿⣿⠃⠀⠀⠀⠀',
    \'⠀⠠⠴⠀⠀⠀⠿⠿⠿⠧⠾⠿⠿⠿⠿⠿⠃⠀⠀⠾⠿⠿⠟⠁⠀    ',
    \'',
    \]

let g:startify_ascii = [
\ "      .            .      ",
\ "    .,;'           :,.    ",
\ "  .,;;;,,.         ccc;.  ",
\ ".;c::::,,,'        ccccc: ",
\ ".::cc::,,,,,.      cccccc.",
\ ".cccccc;;;;;;'     llllll.",
\ ".cccccc.,;;;;;;.   llllll.",
\ ".cccccc  ';;;;;;'  oooooo.",
\ "'lllllc   .;;;;;;;.oooooo'",
\ "'lllllc     ,::::::looooo'",
\ "'llllll      .:::::lloddd'",
\ ".looool       .;::coooodo.",
\ "  .cool         'ccoooc.  ",
\ "    .co          .:o:.    ",
\ "      .           .'      ",
\]

" nerd-commentor "
let g:NERDCustomDelimiters = {
\       'python': { 'left': '#', 'right': '' }
\       }

" nvim-repl "
let g:repl_filetype_commands = {
    \ 'javascript': 'node',
    \ 'python': 'python3',
    \ }
let g:repl_split = 'vertical'

" vim-floaterm "
let g:floaterm_opener        = 'tabe'
let g:floaterm_borderchars   = ['═', '║', '═', '║', '╔', '╗', '╝', '╚']

" rainbow"
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'separately': {
\       'cmake': 0,
\   }
\}

" coc.nvim "
function! Check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction
" <Tab>: completion "
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-N>" :
    \ Check_back_space() ? "\<Tab>" :
    \ coc#refresh()
" <S-Tab>: completion back "
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<C-H>"
" <CR>: confirm completion, or insert <CR> "
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

call coc#config('suggest', {
\  'completionItemKindLabels': {
\     "keyword": "\uf1de",
\     "variable": "\ue79b",
\     "value": "\uf89f",
\     "operator": "\u03a8",
\     "constructor": "\uf0ad",
\     "function": "\u0192",
\     "reference": "\ufa46",
\     "constant": "\uf8fe",
\     "method": "\uf09a",
\     "struct": "\ufb44",
\     "class": "\uf0e8",
\     "interface": "\uf417",
\     "text": "\ue612",
\     "enum": "\uf435",
\     "enumMember": "\uf02b",
\     "module": "\uf40d",
\     "color": "\ue22b",
\     "property": "\ue624",
\     "field": "\uf9be",
\     "unit": "\uf475",
\     "event": "\ufacd",
\     "file": "\uf723",
\     "folder": "\uf114",
\     "snippet": "\ue60b",
\     "typeParameter": "\uf728",
\     "default": "\uf29c"
\   }
\})

" coc-explorer "
let g:coc_explorer_global_presets = {
\  'config': {
\     'position': 'floating',
\     'floating-width': 120,
\     'root-uri': '~/.config/nvim/lua',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'floating': {
\     'position': 'floating',
\     'floating-width': 120,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\ }
]])

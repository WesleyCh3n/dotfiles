"===================================="
"|          Plugins Config          |"
"===================================="
" Plugin: auto-pairs
let g:AutoPairsShortcutJump = '<S-tab>'

" Plugin: nvim-repl
tnoremap <Esc> <C-\><C-n>
let g:repl_filetype_commands = {
    \ 'javascript': 'node',
    \ 'python': 'python3',
    \ }
let g:repl_split = 'vertical'
" let g:repl_height = 15
" let g:repl_width = ''

" Plugin: vim-floaterm
let g:floaterm_opener        = 'tabe'
let g:floaterm_borderchars   = ['═', '║', '═', '║', '╔', '╗', '╝', '╚']

" Plugin: rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'separately': {
\       'cmake': 0,
\   }
\}

" Plugin: indentLine
let g:indentLine_char = '│'

" PLugin: vim-startify
let g:startify_ascii = [
\ "                     .            .      ",
\ "                   .,;'           :,.    ",
\ "                 .,;;;,,.         ccc;.  ",
\ "               .;c::::,,,'        ccccc: ",
\ "               .::cc::,,,,,.      cccccc.",
\ "               .cccccc;;;;;;'     llllll.",
\ "               .cccccc.,;;;;;;.   llllll.",
\ "               .cccccc  ';;;;;;'  oooooo.",
\ "               'lllllc   .;;;;;;;.oooooo'",
\ "               'lllllc     ,::::::looooo'",
\ "               'llllll      .:::::lloddd'",
\ "               .looool       .;::coooodo.",
\ "                 .cool         'ccoooc.  ",
\ "                   .co          .:o:.    ",
\ "                     .           .'      ",
\]
let g:startify_custom_header = g:startify_ascii
let g:startify_bookmarks = [
\ '$HOME/.zshrc',
\ '$HOME/.tmux.conf',
\ '$HOME/.config/nvim/init.vim']
let g:startify_files_number = 10
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recent']   },
      \ { 'type': 'sessions',  'header': ['   Sessions'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']},
      \ { 'type': 'commands',  'header': ['   Commands'] },
      \ ]
let g:startify_commands = [
    \ {'n': 'CocCommand explorer --preset floating'},
    \ {'v': 'CocCommand explorer --preset .vim'},
    \ {'g': 'FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 lazygit'},
    \ {'t': 'FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 bpytop'},
    \ ]
let g:indentLine_bufNameExclude = ['startify']
highlight StartifyHeader ctermfg=115

let g:SimpylFold_fold_docstring = 0

let g:tagbar_width=30

" Plugin: markdown-preview
let g:mkdp_auto_close = 0
nmap <C-p> <Plug>MarkdownPreviewToggle
" let g:mkdp_auto_start = 1
" let g:mkdp_browser = 'firefox'
" let g:vim_markdown_folding_disabled = 1

" Plugin: nerd-commentor
let g:NERDSpaceDelims = 1

" Plugin: coc-explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'position': 'floating',
\     'floating-width': 120,
\     'root-uri': '~/.config/nvim/config',
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
nnoremap <silent> <space>e  :CocCommand explorer<CR>
nnoremap <silent> <space>E  :CocCommand explorer --preset floating<CR>
nnoremap <silent> <space>ac :CocCommand explorer --preset .vim<cr>

" Plugin: vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plugin: coc-snippet
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>x  <Plug>(coc-convert-snippet)
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

" Plugin: python-syntax
let g:python_highlight_all=1

" Plugin: coc.nvim
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

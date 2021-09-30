"===================================="
"|          Plugins Config          |"
"===================================="
" Plugin: auto-pairs
let g:AutoPairsShortcutJump = '<S-tab>'

" Plugin: indentLine
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" Plugin: nvim-repl
tnoremap <Esc> <C-\><C-n>
let g:repl_filetype_commands = {
    \ 'javascript': 'node',
    \ 'python': 'python3',
    \ }
let g:repl_split = 'vertical'
" let g:repl_height = 15
" let g:repl_width = ''
" For virtual env
" let g:repl_python_pre_launch_command = "source /path_to_new_venv/bin/activate"

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
let g:ascii = [
\'                     !!!!                      ',
\'                   ::::::::                    ',
\'       __________ ;;;;;;;;; __________         ',
\'       \________/ ????????> \________/         ',
\'        |......| $$$$$$$"  :......."           ',
\'        |::::::| $$$$$"" .::::::; ,OO          ',
\'       O|;;;;;;| $$$" .;;;;;;;;  ,OOOO`        ',
\'     GDD|;;;;;;| ?  .;;;;;;;  ,OOOOONHF`       ',
\'      `D|IIIIII|  IIIIII7I  ,DDDDDDDNF`        ',
\'        |IIIIIII7IIIIII7 ,DDDDDDDNFF`          ',
\'        |EEEEEEEEEEEZ  ,DDDDDDDNF`             ',
\'        |888888888Z  ,DNNNDDDNF`               ',
\'        |8888888Z  .DDDDDDDNF`                 ',
\'        |8888Z    ,DNNNNNNF`                   ',
\'        `""`       "MMMMM"                     ',
\'                     """                       ',
\'']
" let g:startify_custom_header = startify#center(g:ascii)
let g:startify_custom_header = g:ascii
let g:startify_bookmarks = ['$HOME/.vimrc', '$HOME/.tmux.conf', '$HOME/.zshrc', '$HOME/Documents/GitHub/']
let g:startify_files_number = 5
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_commands = [
    \ {'n': 'CocCommand explorer'},
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
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'open-action-strategy': 'sourceWindow',
\   },
\ }
nnoremap <silent> <space>ac :CocCommand explorer --preset .vim<cr>
nnoremap <silent> <space>e  :CocCommand explorer --preset floating<CR>
" nnoremap <silent> <space>e :CocCommand explorer<CR>

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


" " Plugin: Tablemode
" nnoremap ,t :TableModeEnable<cr>
" nnoremap ,dt :TableModeDisable<cr>

" " Plugin: animate
" nnoremap <silent> <Up>    :call animate#window_delta_height(5)<CR>
" nnoremap <silent> <Down>  :call animate#window_delta_height(-5)<CR>
" nnoremap <silent> <Left>  :call animate#window_delta_width(5)<CR>
" nnoremap <silent> <Right> :call animate#window_delta_width(-5)<CR>

" " Plugin: python-syntax
" let g:python_highlight_all=1

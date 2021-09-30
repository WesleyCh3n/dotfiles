"===================================="
"|            Mapping               |"
"===================================="
let mapleader = ","

"================================"
"|             vimrc            |"
"================================"
map <silent> \rc :tabe ~/.vim/config<cr>
augroup source_vimrc
    au!
    au bufwritepost *.vim source $MYVIMRC | AirlineRefresh | call webdevicons#refresh()
augroup END


"================================"
"|        Plugin Mapping        |"
"================================"
" Plugin: nvim-repl
nnoremap ,r :ReplToggle<CR>
nmap <leader>w <Plug>ReplSendLine
vmap <leader>w <Plug>ReplSendVisual

" hop.nvim
nnoremap <leader>f :lua require'hop'.hint_words()<cr>
nnoremap <leader>l :lua require'hop'.hint_lines()<cr>

" floaterm intergrated
let g:floaterm_keymap_toggle = '<space>at'
let g:floaterm_keymap_prev   = '<space>fp'
let g:floaterm_keymap_next   = '<space>fn'
let g:floaterm_opener        = 'tabe'
let g:floaterm_borderchars   = ['═', '║', '═', '║', '╔', '╗', '╝', '╚']
nnoremap <silent> <space>fl :CocList floaterm<cr>
" nnoremap <silent> <space>ac :cal Nac()<cr>
fun! Nac()
    execute ":FloatermNew --height=0.8 --width=0.9 --name=floaterm1 nnn ".$HOME."/.vim/config/"
endf
nnoremap <silent> <space>ar :call CPlusCompile()<CR>
nnoremap <silent> <space>as :FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1<CR>
nnoremap <silent> <space>ag :FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 lazygit<CR>
nnoremap <silent> <space>ad :FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 lazydocker<CR>
nnoremap <silent> <space>an :FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 nnn<CR>
nnoremap <silent> <space>ab :FloatermNew --height=0.8 --width=0.8 --name=floaterm1 --autoclose=1 bpytop<CR>

vnoremap <space>bv !boxes -s 80 -a c -d vim-box<CR>
vnoremap <space>bc !boxes -s 80 -a c -d cc<CR>
vnoremap <space>bp !boxes -s 80 -a c -d shell<CR>
vnoremap <space>bb !boxes -s 80 -a c -d 

" window size
nnoremap <space>H :call animate#window_percent_height()<left>
nnoremap <silent> <space>h :call animate#window_percent_height(1)<cr>
nnoremap <silent> <space>l :call animate#window_percent_height(0)<cr>

" Tab
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>= :res +
nnoremap <leader>- :res -
nnoremap <silent> <leader>n :let @/=""<CR>
nnoremap <silent> <leader>y viw"0p
nnoremap <leader>s :%s//gc<Left><Left><Left>

" Others
inoremap jk <Esc>
inoremap kj <Esc>
nnoremap > >>
nnoremap < <<
nnoremap Y y$
nnoremap 0 ^
nnoremap <expr>q exists("b:Running") ? 'ZQ' : 'q'
nnoremap <silent>Q :call CheckBuf()<cr>
nnoremap <C-t> :tabnew<CR>:Startify<CR>
nnoremap <C-x> :tabclose<CR>
nnoremap <silent> <leader>< :tabmove -<cr>
nnoremap <silent> <leader>> :tabmove +<cr>

nnoremap <right> 10zl
nnoremap <left> 10zh

nnoremap <silent> <space>rt :retab<cr>:w<cr>
nnoremap <silent> <space>ri :normal! gg=G<cr><c-o><c-o>
nnoremap <silent> <space>p :set paste!<cr>
nnoremap <silent> <space>w :w<cr>
nnoremap <silent> <space>q :q<cr>
nnoremap <silent> <space>fw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


augroup aucmd_
    au filetype cpp,python nnoremap <silent> ,m :call RunCode()<cr>
    au filetype go nnoremap ,m :w<bar>:GoRun<space>%<cr>
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    au filetype tex setl updatetime=1000
    au filetype python setlocal define=^\\s*\\<\\(def\\\|class\\)\\>
    au filetype python nnoremap gf [<C-D>
    au filetype html let b:AutoPairs = {"<": ">"}
    au filetype html,javascript,sh,zsh set tabstop=2 softtabstop=2 shiftwidth=2
    au filetype md setlocal wrap
augroup END


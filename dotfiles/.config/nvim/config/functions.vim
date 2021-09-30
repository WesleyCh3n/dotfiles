"=================================================="
"                    CodeRunner                    "
"=================================================="
function! BufWidth()
  let width = winwidth(0)
  let numberwidth = max([&numberwidth, strlen(line('$'))+1])
  let numwidth = (&number || &relativenumber)? numberwidth : 0
  let foldwidth = &foldcolumn

  if &signcolumn == 'yes'
    let signwidth = 2
  elseif &signcolumn == 'auto'
    let signs = execute(printf('sign place buffer=%d', bufnr('')))
    let signs = split(signs, "\n")
    let signwidth = len(signs)>2? 2: 0
  else
    let signwidth = 0
  endif
  return width - numwidth - foldwidth - signwidth
endfunction

func! ToggleRunMode()
    if !exists("b:Running")
        let b:Running=1
    else
        unlet b:Running
    endif
    return ""
endf

func! PythonRunner()
    silent exe "1new | 0read ! python3 -B" expand('%')
    " let l;IMAGE =  "python:3.7.9-slim-buster"
    "let l:IMAGE =  "python:3.9.0rc2-slim"
    "silent exe "1new | 0read ! docker run -it --rm -v ".expand('%:p:h').":/home/ -w /home/ ".l:IMAGE." python3 -B ".expand('%:t')
    resize 10
    setl colorcolumn=
    silent exe "normal! ggO".repeat("=", BufWidth())
    silent exe "normal! Go".repeat("=", BufWidth())
endf

func! CPlusRunner()
    silent exe "1new | 0read ! g++ ".expand('%:p')." -std=c++17 -o out"
    silent exe "normal! ggO".repeat("=", BufWidth()/2+1)
    resize 10
    setl nomodifiable
    setl buftype=nofile
    setl nonu norelativenumber
    setl colorcolumn=
    call ToggleRunMode()
    silent file CompilingResult
    vs | term ++curwin ./out
    setl nonu norelativenumber
    setl colorcolumn=
    silent exe "!rm ./out"
endf

func! CPlusCompile()
    if filereadable(expand('%:p:r'))
        silent exe "read !rm ".expand('%:p:r')
    endif
    silent exe 'read !g++ '.shellescape('%').' -o '.shellescape('%:r')
    exe ":FloatermNew --autoclose=0"." ".expand('%:p:r')." && rm ".expand('%:p:r')
endf

" RunCode
func! RunProcess()
    " silent write
    echo "  "
    " let l:currentWindow=winnr()
    if &ft=='python'
        call PythonRunner()
        call animate#window_percent_height(0.25)
    elseif &ft=='cpp'
        call CPlusRunner()
    endif
    normal! gg
    setl nomodifiable
    setl buftype=nofile
    call ToggleRunMode()
    silent file RunningResult
    " exe l:currentWindow . "wincmd w"
endf

fun! RunCode()
    if bufwinnr("RunningResult") > 0
        silent bdelete RunningResult
    endif
    if bufwinnr("CompilingResult") > 0
        silent bdelete CompilingResult
    endif
    call RunProcess()
endf

fun! CheckBuf()
    if bufwinnr("RunningResult") > 0 || bufwinnr("CompilingResult") > 0
        bdelete RunningResult
        bdelete CompilingResult
    endif
endf

"=================================================="
"                    Refresh UI                    "
"=================================================="
function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
fun! RefreshUI()
    AirlineRefresh
    call webdevicons#refresh()
endf


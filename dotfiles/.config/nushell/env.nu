# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
let-env PATH = (
    if "Path" in $env {
        $env.Path | split row (char esep)
        | prepend 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin\'
        # | prepend 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build'
    } else {
        $env.PATH | split row (char esep)
        | prepend 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin\'
        # | prepend 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build'
    }
)

let-env EDITOR = 'nvim'
let-env VISUAL = 'nvim'

let-env OPENCV_INCLUDE_PATHS = 'C:\tools\opencv\build\include'
let-env OPENCV_LINK_PATHS = 'C:\tools\opencv\build\x64\vc15\lib'
let-env OPENCV_LINK_LIBS = 'opencv_world460'


mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

zoxide init nushell | save -f ~/.zoxide.nu

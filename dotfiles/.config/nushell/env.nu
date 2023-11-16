# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
$env.PATH = (
    if "Path" in $env {
        $env.Path | split row (char esep)
        | prepend 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin\'
    } else {
        $env.PATH | split row (char esep)
        | prepend 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin\'
    }
)

def nu_require [] {
  if (nu --version) < "0.86.0" {
    error make {
      msg: "nushell requires at least version 0.86.0"
    }
  }
}

$env.EDITOR = 'nvim'
$env.VISUAL = 'nvim'

$env.OPENCV_INCLUDE_PATHS = 'C:\tools\opencv\build\include'
$env.OPENCV_LINK_PATHS = 'C:\tools\opencv\build\x64\vc15\lib'
$env.OPENCV_LINK_LIBS = 'opencv_world460'

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

zoxide init nushell | save -f ~/.zoxide.nu

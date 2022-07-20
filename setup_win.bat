REM wezterm
mklink %userprofile%\.wezterm.lua   %CD%\.wezterm.lua
REM fd
mklink %APPDATA%\fd\ignore          %CD%\dotfiles\.config\fd\ignore
REM lazygit
mklink %APPDATA%\lazygit\config.yml %CD%\dotfiles\.config\lazygit\config.yml
REM rustfmt
mklink /d %APPDATA%\rustfmt %CD%\dotfiles\.config\rustfmt

@echo off
echo wezterm...
del %userprofile%\.wezterm.lua
mklink %userprofile%\.wezterm.lua   %CD%\dotfiles\.wezterm.lua

echo nushell...
mkdir %APPDATA%\nushell\
del %APPDATA%\nushell\config.nu
del %APPDATA%\nushell\env.nu
mklink %APPDATA%\nushell\config.nu %CD%\dotfiles\.config\nushell\config.nu
mklink %APPDATA%\nushell\env.nu %CD%\dotfiles\.config\nushell\env.nu

echo fd...
mkdir %APPDATA%\fd\
del %APPDATA%\fd\ignore
mklink %APPDATA%\fd\ignore          %CD%\dotfiles\.config\fd\ignore

echo lazygit...
mkdir %APPDATA%\lazygit\
del %APPDATA%\lazygit\config.yml
mklink %APPDATA%\lazygit\config.yml %CD%\dotfiles\.config\lazygit\config.yml

echo rustfmt...
mkdir %APPDATA%\rustfmt\
del %APPDATA%\rustfmt\rustfmt.toml
mklink %APPDATA%\rustfmt\rustfmt.toml %CD%\dotfiles\.config\rustfmt\rustfmt.toml

echo Finished!

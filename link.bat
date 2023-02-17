@echo off

cls
call:header Start linking files and folders

call:link_file %CD%\win\starship.toml %userprofile%\.config starship.toml
call:link_file %CD%\dotfiles\.config\nushell\config.nu %APPDATA%\nushell config.nu
call:link_file %CD%\dotfiles\.config\nushell\env.nu %APPDATA%\nushell env.nu
call:link_file %CD%\dotfiles\.config\fd\ignore %APPDATA%\fd ignore
call:link_file %CD%\dotfiles\.config\lazygit\config.yml %APPDATA%\lazygit config.yml
call:link_file %CD%\dotfiles\.config\rustfmt\rustfmt.toml %APPDATA%\rustfmt rustfmt.toml

call:link_dir %CD%\dotfiles\.config\nvim %LocalAppData%\nvim

call:header Operation Finished Successfully
EXIT /B %ERRORLEVEL%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:link_file
set in_path=%~1
set out_dir=%~2
set out_file=%~3

echo ...Creating %out_dir%
if not exist %out_dir% (
  mkdir %out_dir%
) else (
  echo ......Already exist
)
echo ......Done

echo ...Removing existing link file %out_dir%\%out_file%
if exist %out_dir%\%out_file% (
  del %out_dir%\%out_file%
) else (
  echo ......No need
)
echo ......Done

echo ...Make link from %in_path% to %out_dir%\%out_file%
mklink %out_dir%\%out_file% %in_path% > NUL
echo ......Done
ECHO -------------------------------------------------
EXIT /B 0

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:link_dir
set in_dir=%~1
set out_dir=%~2
echo ...Removing existing link file %out_dir%
if exist %out_dir% (
  rmdir %out_dir%
) else (
  echo ......No need
)
echo ......Done

echo ...Make link from %in_dir% to %out_dir%
mklink /d %out_dir% %in_dir%

EXIT /B 0

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:header
ECHO =================================================
ECHO %*
ECHO =================================================
EXIT /B 0

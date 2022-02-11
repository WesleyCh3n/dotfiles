# $PROFILE = $HOME/Documents/PowerShell/
New-Item -ItemType SymbolicLink -Force -Path $PROFILE -Target $HOME/dotfiles/dotfiles/Microsoft.PowerShell_profile.ps1

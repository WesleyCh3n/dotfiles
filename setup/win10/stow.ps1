# PROFILE
New-Item -ItemType SymbolicLink -Force -Path $PROFILE -Target $HOME/dotfiles/dotfiles/Microsoft.PowerShell_profile.ps1

# nvim
New-Item -ItemType SymbolicLink -Force -Path $HOME/.config/nvim -Target $HOME/dotfiles/dotfiles/.config/nvim
New-Item -ItemType SymbolicLink -Force -Path $HOME/AppData/Local/nvim -Target $HOME/dotfiles/dotfiles/.config/nvim

# git
New-Item -ItemType SymbolicLink -Force -Path $HOME/.gitconfig -Target $HOME/dotfiles/dotfiles/.gitconfig

# fd
New-Item -ItemType SymbolicLink -Force -Path $HOME/.fdignore -Target $HOME/dotfiles/dotfiles/.fdignore

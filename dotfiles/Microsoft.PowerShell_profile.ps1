Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineOption -EditMode vi

Set-PsFzfOption -TabExpansion
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'


# Autocompletion for arrow keys
# Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Chord Shift+Tab -Function AcceptSuggestion
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Bash like movement
Set-PSReadlineKeyHandler -Chord ctrl+d -Function ViExit
Set-PSReadlineKeyHandler -Chord ctrl+w -Function BackwardDeleteWord
Set-PSReadlineKeyHandler -Chord ctrl+e -Function EndOfLine
Set-PSReadlineKeyHandler -Chord ctrl+a -Function BeginningOfLine

# oh-my-posh
Set-PoshPrompt -Theme negligible

# alias
New-Alias which get-command
Set-Alias vi nvim
Set-Alias vv neovide
Set-Alias lg lazygit
Set-Alias n vifm

# VcXser: allow X11 fowarding
$env:DISPLAY='localhost:0.0'

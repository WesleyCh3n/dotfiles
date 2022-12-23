# Nushell config file

let-env config = {
    show_banner: false
}

alias vi = nvim
alias lg = lazygit
alias pwd = @echo %cd%
alias mwsl = wsl.exe -u root -e mount --make-rshared /

source ~/.cache/starship/init.nu
source ~/.zoxide.nu

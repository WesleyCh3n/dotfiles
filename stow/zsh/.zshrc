# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
################################################################################
#                              Zsh Basic setting                               #
################################################################################
ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH="$HOME/.oh-my-zsh"
plugins=(git virtualenv docker vi-mode \
    zsh-autosuggestions zsh-syntax-highlighting zsh-completions)
source $ZSH/oh-my-zsh.sh

bindkey '^[[Z' autosuggest-accept

################################################################################
#                             environment variable                             #
################################################################################
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/.local/nvim-osx64/bin/
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

################################################################################
#                                    alias                                     #
################################################################################
alias vi='nvim'
alias python='python3 -B'
alias lg='lazygit'
alias ldk='lazydocker'
alias a='ansible'
alias ap='ansible-playbook'
alias aria2c='/usr/local/aria2/bin/aria2c  --enable-rpc'

################################################################################
#                                 nnn setting                                  #
################################################################################
export VISUAL=nvim
export EDITOR="$VISUAL"
export NNN_BMS="\
g:$HOME/Documents/GitHub;\
m:$HOME/.config/nnn/mounts/;\
d:$HOME/dotfiles"

n () {
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

################################################################################
#                                    pfetch                                    #
################################################################################
export PF_COL1=7
export PF_COL3=7
pfetch

################################################################################
#                                     p10k                                     #
################################################################################
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g powerlevel9k_instant_prompt=quiet

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]];
then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################################################################
#                              Zsh Basic setting                               #
################################################################################

ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
autoload -Uz compinit
compinit
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
  zgen load romkatv/powerlevel10k powerlevel10k
  zgen load zsh-users/zsh-autosuggestions
  zgen load zdharma-continuum/fast-syntax-highlighting
  zgen load Aloxaf/fzf-tab
  zgen load jeffreytse/zsh-vi-mode
  zgen save
fi

ZVM_KEYTIMEOUT=0.1
ZVM_VI_HIGHLIGHT_BACKGROUND=yellow
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=$HOME/.zsh_history

################################################################################
#                             environment variable                             #
################################################################################
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:/usr/local/go/bin
if [[ $(command -v go) ]]; then
  export GOPATH=$HOME/golib
  export PATH=$PATH:$(go env GOPATH)/bin
fi
[ -d $HOME/.npm-global ] && export PATH=$HOME/.npm-global/bin:$PATH
[ -f /usr/bin/microsoft-edge-dev ] && export BROWSER=/usr/bin/microsoft-edge-dev
[ -d /usr/local/opt/coreutils/libexec/gnubin/ ] && export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
[ -f $HOME/.config/wsl/wsl.sh ] && source $HOME/.config/wsl/wsl.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export VISUAL=nvim
export EDITOR="$VISUAL"

################################################################################
#                                plugin setting                                #
################################################################################
# fzf
export FZF_DEFAULT_OPTS='--height 40% --border'
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf-tab
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'
# zsh-autosuggestions
# bindkey '^[[Z' autosuggest-accept
function zvm_after_init() {
  zvm_bindkey viins '^[[Z' autosuggest-accept
}
# zoxide
eval "$(zoxide init zsh)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [[ $(command -v pyenv) ]]; then
  eval "$(pyenv init -)"
fi

################################################################################
#                                    alias                                     #
################################################################################
[ -s "$HOME/.local/bin/exa" ] && alias ls='exa'
[ -s "$HOME/.local/bin/nvim" ] && alias vi='nvim'
alias vv='neovide --frame none'
alias lg='lazygit'
alias ldk='lazydocker'
alias a='ansible'
alias ap='ansible-playbook'
alias aria2c='/usr/local/aria2/bin/aria2c  --enable-rpc'
alias pprint='python -m json.tool'
alias tn='tmux new ~/.local/bin/tmux-sessionizer'
alias ta='tmux a'

################################################################################
#                                 nnn setting                                  #
################################################################################
export NNN_BMS=$NNN_BMS"\
g:$HOME/GitHub;\
m:$HOME/.config/nnn/mounts/;\
d:$HOME/dotfiles;\
c:$HOME/.config;"
export NNN_PLUG='x:!chmod +x $nnn'

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
#                                     p10k                                     #
################################################################################

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g powerlevel9k_instant_prompt=quiet

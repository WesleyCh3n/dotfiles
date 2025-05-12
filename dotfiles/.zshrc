if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]];
then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################################################################
# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit wait lucid depth=1 atload'_zsh_autosuggest_start' light-mode for \
  zsh-users/zsh-autosuggestions \
  zdharma-continuum/fast-syntax-highlighting \
  zsh-users/zsh-completions \
  Aloxaf/fzf-tab

autoload -Uz compinit && compinit
zinit cdreplay -q

# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g powerlevel9k_instant_prompt=quiet

# History
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
HISTFILE=$HOME/.zsh_history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# bindkey
bindkey -v
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export VISUAL=nvim
export EDITOR="$VISUAL"

################################################################################
# PATH
export PATH=$PATH:$HOME/.local/bin/

# golang
if [[ $(command -v go) ]]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/golib
  export PATH=$PATH:$(go env GOPATH)/bin
fi
# npm & nvm
[ -d $HOME/.npm-global ] && export PATH=$HOME/.npm-global/bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# docker
[ -d $HOME/.docker/completions ] && export FPATH="$HOME/.docker/completions:$FPATH"

################################################################################
# fzf
export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border top'
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf-tab
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

source <(fzf --zsh)
eval "$(zoxide init zsh)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [[ $(command -v pyenv) ]]; then
  eval "$(pyenv init -)"
fi

################################################################################
#                                    alias                                     #
################################################################################
[ -s "$HOME/.local/bin/nvim" ] && alias vi='nvim'
alias ls="ls --color"
alias vl='nvim -u $HOME/.config/nvim/leetcode.lua'
alias lg='lazygit'
alias tn='tmux new ~/.local/bin/tmux-sessionizer'
alias ta='tmux a'
alias aria2c='/usr/local/aria2/bin/aria2c  --enable-rpc'

# nnn config
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

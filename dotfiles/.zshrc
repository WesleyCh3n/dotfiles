# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]];
then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
################################################################################
#                              Zsh Basic setting                               #
################################################################################
if [ -f $HOME/.zplug/init.zsh ]; then
  source $HOME/.zplug/init.zsh
  zplug "plugins/git",                       from:oh-my-zsh
  zplug "plugins/virtualenv",                from:oh-my-zsh
  zplug "plugins/docker",                    from:oh-my-zsh
  zplug "plugins/vi-mode",                   from:oh-my-zsh
  zplug "plugins/common-aliases",            from:oh-my-zsh
  zplug "plugins/fzf",                       from:oh-my-zsh
  zplug "romkatv/powerlevel10k",             as:theme, depth:1
  zplug "zsh-users/zsh-autosuggestions",     as:plugin
  zplug "zsh-users/zsh-syntax-highlighting", as:plugin
  zplug "zsh-users/zsh-completions",         as:plugin

  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
      printf "Install? [y/N]: "
      if read -q; then
          echo; zplug install
      fi
  fi
  # Then, source plugins and add commands to $PATH
  zplug load #--verbose
else
  echo "zplug not installed, so no plugins available"
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=$HOME/.zsh_history

################################################################################
#                                plugin setting                                #
################################################################################
bindkey '^[[Z' autosuggest-accept

################################################################################
#                             environment variable                             #
################################################################################
export PATH=$PATH:$HOME/.local/bin/
if [[ $(command -v go) ]]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/golib
  export PATH=$PATH:$(go env GOPATH)/bin
  export GOPATH=$GOPATH:$HOME/gocode
fi
if [ -d $HOME/.npm-global ]; then
  export PATH=$HOME/.npm-global/bin:$PATH
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

################################################################################
#                                    alias                                     #
################################################################################
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
alias vi='nvim'
alias vv='neovide'
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
g:$HOME/GitHub;\
m:$HOME/.config/nnn/mounts/;\
d:$HOME/dotfiles;\
c:$HOME/.config"
if [ -f $HOME/.config/wsl/nnn_bms.sh ]; then
  source $HOME/.config/wsl/nnn_bms.sh
fi

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

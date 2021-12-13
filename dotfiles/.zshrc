################################################################################
#                              Zsh Basic setting                               #
################################################################################
if [ -f $HOME/.zplug/init.zsh ]; then
  source $HOME/.zplug/init.zsh
  zplug "plugins/git",                       from:oh-my-zsh
  zplug "plugins/virtualenv",                from:oh-my-zsh
  zplug "plugins/docker",                    from:oh-my-zsh
  zplug "plugins/vi-mode",                   from:oh-my-zsh
  zplug "romkatv/powerlevel10k",             as:theme, depth:1
  zplug "zpm-zsh/ls",                        as:plugin
  zplug "zsh-users/zsh-autosuggestions",     as:plugin
  zplug "zsh-users/zsh-syntax-highlighting", as:plugin
  zplug "zsh-users/zsh-completions",         as:plugin
  zplug "Aloxaf/fzf-tab",                    as:plugin

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
KEYTIMEOUT=1

SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=$HOME/.zsh_history

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]];
then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
################################################################################
#                                plugin setting                                #
################################################################################
bindkey '^[[Z' autosuggest-accept

################################################################################
#                             environment variable                             #
################################################################################
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:/usr/local/go/bin
if [[ $(command -v go) ]]; then
  export GOPATH=$HOME/golib
  export PATH=$PATH:$(go env GOPATH)/bin
  export GOPATH=$GOPATH:$HOME/gocode
fi
if [ -d $HOME/.npm-global ]; then
  export PATH=$HOME/.npm-global/bin:$PATH
fi
[ -f /usr/bin/microsoft-edge-dev ] && export BROWSER=/usr/bin/microsoft-edge-dev
# macos coreutils
[ -d /usr/local/opt/coreutils/libexec/gnubin/ ] && export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

################################################################################
#                                    alias                                     #
################################################################################
alias ls='logo-ls'
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
export NNN_PLUG='x:!chmod +x $nnn'

BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

[ -f $HOME/.config/wsl/nnn_bms.sh ] && source $HOME/.config/wsl/nnn_bms.sh

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

export FZF_DEFAULT_OPTS='--height 40% --border'
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

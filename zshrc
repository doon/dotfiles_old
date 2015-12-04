# completion
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=** r:|=**' '+l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=5
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

autoload -U compinit
compinit

#include zmv
autoload -U zmv

autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  export ZLSCOLORS="${LS_COLORS}"
fi

#put directory in titlebar
case $TERM in
      *xterm*|ansi)
         function settab { print -Pn "\e]1;${SSH_CONNECTION+"%n@%m:"} %~\a" }
         function settitle { print -Pn "\e]2;${SSH_CONNECTION+"%n@%m:"} %~\a" }
         function chpwd { settab;settitle }
         settab;settitle
      ;;
esac


# No arguments: `git status`
# # With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

# Complete g like git
compdef g=git

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

if [ -d ~/projects ]; then
  function p { cd ~/projects/$1 }
  compctl -/ -W ~/projects p
fi

if [ -d ~/.vim/sessions ] ; then 
  function v { cd ~/projects/$1 && vi -S ~/.vim/sessions/$1 }
  compctl -f -W ~/.vim/sessions v
fi

# emacs mode
bindkey -e

# use incremental search
bindkey '^R' '^R' '^R' history-incremental-search-backward

# ignore duplicate history entries
setopt histignoredups

# keep more history
export HISTSIZE=200
export SAVEHIST=200
export HISTFILE=~/.zsh_history
setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt hist_no_functions
setopt no_hist_beep
setopt hist_save_no_dups

if [[ -d /usr/local/share/npm/bin ]]; then PATH=/usr/local/share/npm/bin:$PATH; fi
PATH=/usr/local/bin:~/bin:$PATH;
export PATH
# expand functions in the prompt
setopt prompt_subst


# prompt
export PROMPT='[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%2c%{$reset_color%}] '

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}%f'

if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

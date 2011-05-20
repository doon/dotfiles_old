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

#put directory in titlebar
case $TERM in
      *xterm*|ansi)
         function settab { print -Pn "\e]1; %~\a" }
         function settitle { print -Pn "\e]2; %~\a" }
         function chpwd { settab;settitle }
         settab;settitle
      ;;
esac

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# emacs mode
bindkey -e

# use incremental search
bindkey ^R ^R ^R history-incremental-search-backward

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

#we want to run features/spec in autotest
export AUTOFEATURE=true
export RSPEC=true
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

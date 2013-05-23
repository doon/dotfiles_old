# makes color constants available
autoload -U colors
colors
#include zmv
autoload -U zmv
# enable colored output from ls, etc
export CLICOLOR=1

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

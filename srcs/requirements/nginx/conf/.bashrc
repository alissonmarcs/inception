[[ $- != *i* ]] && return


PS1=' \001\033[1;36m\002\W\001\033[0m\002 $ '
alias ls="ls --color=auto"
alias less="less -S -N"
alias rm="rm -rf"
alias c="clear"
alias f="free -h"

export EDITOR="/usr/bin/vim"

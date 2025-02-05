#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="~/.dotnet/tools:$PATH"

export PATH="/usr/bin/anydesk-6.4.0/:$PATH"

export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
EDITOR=/usr/bin/nvim
TERMINAL=/usr/bin/ghostty

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_git ]; then
. ~/.bash_git
fi

if [ -d "/opt1/" ]; then
   export TERM=xterm-256color
   source /opt1/script.sh
   [ -z "$TMUX" ] && exec tmux
fi

RED='\033[0;31m'
LRED='\033[1;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
BLUE='\033[0;34m'
LBLUE='\033[1;34m'
PURPLE='\033[0;35m'
LPURPLE='\033[1;35m'
CYAN='\033[0;36m'
LCYAN='\033[1;36m'
NC='\033[0m'

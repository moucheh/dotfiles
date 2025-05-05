# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_git ]; then
  . ~/.bash_git
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

if [ -d "/opt1/" ]; then
   export TERM=xterm-256color
   source /opt1/script.sh
   [ -z "$TMUX" ] && exec tmux
fi

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

myrename () {
  for file in $1/*; do mv -v "$file" "`echo $file | tr ' ' '_' | tr '[A-Z]' '[a-z]' | tr -d ',' | tr -d '(' | tr -d ')'`"; done 
}

export PS1="\[╭─ \w\n╰\[\033[0;34m\]\u\[\033[0m\]@\h \[\033[0;34m\]->>\[\033[0m\] "

export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/bin/ghostty
export OPENSSL_DIR=/usr/bin/openssl

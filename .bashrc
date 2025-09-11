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

PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.go/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export PS1="\[╭─ \w\n╰\[\033[0;34m\]\u\[\033[0m\]@\h \[\033[0;34m\]->>\[\033[0m\] "

export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/bin/foot
export OPENSSL_DIR=/usr/bin/openssl
export GRIM_DEFAULT_DIR=$(xdg-user-dir PICTURES)/Screenshots/
export GOPATH=$HOME/.go/

eval `keychain -q --eval --agents ssh gh_key gl_key`
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"

PROMPT_COMMAND='printf "\e]7;file://%s%s\a" "$HOSTNAME" "$PWD"; '"$PROMPT_COMMAND"

set -o vi

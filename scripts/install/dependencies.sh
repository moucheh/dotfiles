#!/bin/bash

read -n1 -p "Do you want to install dependencies using dnf? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    sudo dnf install sway git nvim\
      waybar tmux clangd clang clang++ cargo\
      gcc g++ foot fuzzel lazygit nwg-drawer nwg-dock\
      dunst nodejs npm python3 pip fzf
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

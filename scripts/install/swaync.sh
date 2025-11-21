#!/bin/bash

read -n1 -p "Do you want to install swaync using dnf? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    sudo dnf copr enable erikreider/SwayNotificationCenter
    sudo dnf install SwayNotificationCenter
    ln -s ~/.dotfiles/config/swaync ~/.config
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac


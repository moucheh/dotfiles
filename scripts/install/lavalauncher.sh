#!/bin/bash

read -n1 -p "Do you want to install lavalauncher with dnf as well? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
      sudo dnf install lavalauncher
      sed -i "s/moucheh/$USER/g" ~/.dotfiles/config/lavalauncher/lavalauncher.conf
      ln -s ~/.dotfiles/config/lavalauncher ~/.config
      printf "Lavalauncher has been installed\n\n"
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

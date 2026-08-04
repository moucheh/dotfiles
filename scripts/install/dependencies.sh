#!/bin/env bash

read -n1 -p "Do you want to install dependencies using dnf? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    cat ~/.dotfiles/scripts/install/fedora_packages.txt | xargs sudo dnf install
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

#!/bin/bash

read -n1 -p "Do you want to install swaylock-effects fork using dnf? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    sudo dnf copr enable trs-sod/swaylock-effects
    sudo rpm -e --nodeps swaylock
    sudo dnf install swaylock-effects
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac


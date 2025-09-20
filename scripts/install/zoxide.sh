#!/bin/bash

read -n1 -p "Do you want to install zoxide as the cd replacement using cargo? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    cargo install zoxide
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

#!/bin/bash

read -n1 -p "Do you want to install eza as the ls replacement using cargo? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    cargo install eza
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac


#!/bin/bash

read -n1 -p "Do you want to install starship to customize your prompt? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    curl -sS https://starship.rs/install.sh | sh
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

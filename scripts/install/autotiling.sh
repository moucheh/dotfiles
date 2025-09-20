#!/bin/bash

read -n1 -p "Do you want to install the autotiling script using pip? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    pip install autotiling
    chmod +x $(which autotiling)
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

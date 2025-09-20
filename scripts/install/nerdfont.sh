#!/bin/bash

read -n1 -p "Do you want to download and install CascaydiaCove Nerd Font? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
    cd ~/.local/share/fonts/
    unzip -qq CascadiaCode.zip
    rm CascadiaCode.zip README.md LICENSE
    fc-cache -fv
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

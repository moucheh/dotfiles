#!/bin/bash

DOTFILES=$1
DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

SCRIPTS=$DOTFILES/scripts

read -n1 -p "Do you want to generate custom nvdash art from your username? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    $SCRIPTS/nvdash_art.sh $USER $DOTFILES
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

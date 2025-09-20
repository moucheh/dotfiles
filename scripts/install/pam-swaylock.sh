#!/bin/bash

DOTFILES=$1
DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

DOTFILES_BACKUP_FOLDER=$2
DOTFILES_BACKUP_FOLDER=${DOTFILES_BACKUP_FOLDER:="$HOME/.backup_$(date +%Y%m%d_%H%M%S)"}

read -n1 -p "Do you want to install pam.d swaylock config to enable password entry? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    if [ -e /etc/pam.d/swaylock ]; then
      mkdir -p "$DOTFILES_BACKUP_FOLDER/etc/pam.d/"
      sudo mv /etc/pam.d/swaylock "$DOTFILES_BACKUP_FOLDER/etc/pam.d/swaylock"
      printf "\nBacked up /etc/pam.d/swaylock to $DOTFILES_BACKUP_FOLDER/etc/pam.d/swaylock\n"
    fi
    sudo cp "$DOTFILES/etc/pam.d/swaylock" /etc/pam.d/
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

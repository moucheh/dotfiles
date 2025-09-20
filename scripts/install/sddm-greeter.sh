#!/bin/bash

DOTFILES=$1
DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

DOTFILES_BACKUP_FOLDER=$2
DOTFILES_BACKUP_FOLDER=${DOTFILES_BACKUP_FOLDER:="$HOME/.backup_$(date +%Y%m%d_%H%M%S)"}

read -n1 -p "Do you want to install sddm-greeter theme? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    sudo cp -r $DOTFILES/03-sway-fedora /usr/share/sddm/themes/
    if [ -e /etc/sddm.conf ]; then
      mkdir -p "$DOTFILES_BACKUP_FOLDER/etc"
      sudo mv /etc/sddm.conf "$DOTFILES_BACKUP_FOLDER/etc/sddm.conf"
      printf "\nBacked up /etc/sddm.conf to $DOTFILES_BACKUP_FOLDER/etc/sddm.conf\n"
    fi
    sudo cp "$DOTFILES/etc/sddm.conf" /etc/
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

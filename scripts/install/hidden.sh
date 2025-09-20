#!/bin/bash

DOTFILES=$1
DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

DOTFILES_BACKUP_FOLDER=$2
DOTFILES_BACKUP_FOLDER=${DOTFILES_BACKUP_FOLDER:="$HOME/.backup_$(date +%Y%m%d_%H%M%S)"}

HIDDEN_FILES=(
  bashrc
  bash_aliases
  bash_git
  inputrc
  gitconfig
  clang-format
  prettierrc
  octaverc
  tmux.conf
  'gtkrc-2.0'
)

for i in "${HIDDEN_FILES[@]}"; do
  if [ -e "$HOME/.$i" ]; then
    mv "$HOME/.$i" "$DOTFILES_BACKUP_FOLDER/$i"
    echo "Backed up current $i configuration to $DOTFILES_BACKUP_FOLDER/$i"
  fi
  ln -s "$DOTFILES/hidden/$i" "$HOME/.$i"
  printf "\nInstalled $i configuration\n\n"
done

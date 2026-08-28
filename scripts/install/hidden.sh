#!/usr/bin/env bash

DOTFILES=$1
DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

DOTFILES_BACKUP_FOLDER=$2
DOTFILES_BACKUP_FOLDER=${DOTFILES_BACKUP_FOLDER:="$HOME/.backup_$(date +%Y%m%d_%H%M%S)"}

mkdir -p $DOTFILES_BACKUP_FOLDER

HIDDEN_FILES=(
  bash_aliases
  bash_git
  bash_integration
  bashrc
  clang-format
  gitconfig
  'gtkrc-2.0'
  inputrc
  octaverc
  prettierrc
  tmux.conf
)

for i in "${HIDDEN_FILES[@]}"; do
  if [ -e "$HOME/.$i" ]; then
    mv "$HOME/.$i" "$DOTFILES_BACKUP_FOLDER/$i"
    echo "Backed up current $i configuration to $DOTFILES_BACKUP_FOLDER/$i"
  fi
  ln -s "$DOTFILES/hidden/$i" "$HOME/.$i"
  printf "\nInstalled $i configuration\n\n"
done

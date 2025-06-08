#!/bin/bash

BACKUP_FOLDER=".backup_$(date +%Y%m%d_%H%M%S)"

mkdir -p "$HOME/$BACKUP_FOLDER"

CONFIG_FOLDERS=(
  fastfetch
  foot
  'gtk-3.0'
  lxqt
  nvim
  qt5ct
  qt6ct
  rofi
  sway
  waybar
)

for i in "${CONFIG_FOLDERS[@]}"; do
  if [ -e "$HOME/.config/$i" ]; then
    mv "$HOME/.config/$i" "$HOME/$BACKUP_FOLDER/$i"
  fi
  ln -s "$HOME/.dotfiles/$i/" -t "$HOME/.config/"
done


CONFIG_FILES=(
  .bash_aliases
  .bashrc
  .clang-format
  .gitconfig
  .inputrc
  .octaverc
  .prettierrc
  .tmux.conf
)

for i in "${CONFIG_FILES[@]}"; do
  if [ -e "$HOME/$i" ]; then
    mv "$HOME/$i" "$HOME/$BACKUP_FOLDER/$i"
  fi
  ln -s "$HOME/.dotfiles/$i" -t "$HOME"
done

#!/bin/bash

BACKUP_FOLDER=".backup_$(date +%Y%m%d_%H%M%S)"

mkdir -p "$HOME/$BACKUP_FOLDER"

CONFIG_FOLDERS=(
  ranger
  lazygit
  eza
  fastfetch
  foot
  'gtk-2.0'
  'gtk-3.0'
  lxqt
  nvim
  qt5ct
  qt6ct
  sway
  swaylock
  waybar
  dunst
  fuzzel
)

for i in "${CONFIG_FOLDERS[@]}"; do
  if [ -e "$HOME/.config/$i" ]; then
    mv "$HOME/.config/$i" "$HOME/$BACKUP_FOLDER/$i"
    echo "Backed up current $i configuration to $BACKUP_FOLDER/$i"
  fi
  ln -s "$HOME/.dotfiles/$i/" -t "$HOME/.config/"
  echo "Installed $i configuration"
done

CONFIG_FILES=(
  .bashrc
  .bash_aliases
  .bash_git
  .inputrc
  .gitconfig
  .clang-format
  .prettierrc
  .octaverc
  .tmux.conf
  '.gtkrc-2.0'
  starship.toml
)

for i in "${CONFIG_FILES[@]}"; do
  if [ "$i" == "starship.toml" ]; then
    if [ -e "$HOME/.config/starship.toml" ]; then
      mv "$HOME/.config/starship.toml" "$HOME/$BACKUP_FOLDER/starship.toml"
      echo "Backed up current starship configuration to $BACKUP_FOLDER/$i"
    fi
    ln -s "$HOME/.dotfiles/starship.toml" -t "$HOME/.config/"
    echo "Installed starship configuration"
    continue
  fi

  if [ -e "$HOME/$i" ]; then
    mv "$HOME/$i" "$HOME/$BACKUP_FOLDER/$i"
    echo "Backed up current $i configuration to $BACKUP_FOLDER/$i"
  fi
  ln -s "$HOME/.dotfiles/$i" -t "$HOME"
  echo "Installed $i configuration"
done

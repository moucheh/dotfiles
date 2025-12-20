#!/bin/bash

DOTFILES=$1
DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

DOTFILES_BACKUP_FOLDER=$2
DOTFILES_BACKUP_FOLDER=${DOTFILES_BACKUP_FOLDER:="$HOME/.backup_$(date +%Y%m%d_%H%M%S)"}

CONFIG_FILES=(
  lazygit
  eza
  fastfetch
  foot
  'gtk-2.0'
  'gtk-3.0'
  'gtk-4.0'
  nvim
  qt5ct
  qt6ct
  sway
  swaync
  swayosd
  niri
  wlogout
  swaylock
  waybar
  dunst
  fuzzel
  nwg-dock
  nwg-drawer
  starship.toml
)

for i in "${CONFIG_FILES[@]}"; do
  if [ "$i" == "starship.toml" ]; then
    if [ -e "$HOME/.config/starship.toml" ]; then
      mv "$HOME/.config/starship.toml" "$DOTFILES_BACKUP_FOLDER/starship.toml"
      echo "Backed up current starship configuration to $DOTFILES_BACKUP_FOLDER/$i"
    fi
    ln -s "$DOTFILES/config/starship.toml" -t "$HOME/.config/"
    printf "\nInstalled starship configuration\n\n"
    continue
  fi

  if [ -d "$HOME/.config/$i" ]; then
    mv "$HOME/.config/$i" "$DOTFILES_BACKUP_FOLDER/$i"
    echo "Backed up current $i configuration to $DOTFILES_BACKUP_FOLDER/$i"
  fi
  ln -s "$DOTFILES/config/$i" -t "$HOME/.config/"
  printf "\nInstalled $i configuration\n\n"
done

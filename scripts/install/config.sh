#!/bin/bash

DOTFILES=$1
DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

DOTFILES_BACKUP_FOLDER=$2
DOTFILES_BACKUP_FOLDER=${DOTFILES_BACKUP_FOLDER:="$HOME/.backup_$(date +%Y%m%d_%H%M%S)"}

CONFIG_FILES=(
  'gtk-2.0'
  'gtk-3.0'
  'gtk-4.0'
  qt5ct
  qt6ct
  kdeglobals
  lazygit
  eza
  fastfetch
  foot
  nvim
  swaync
  swayosd
  niri
  wlogout
  gtklock
  waybar
  fuzzel
  nwg-launchers
  starship.toml
  lavalauncher
  btop
)

for i in "${CONFIG_FILES[@]}"; do
  if [ -d "$HOME/.config/$i" ]; then
    mv "$HOME/.config/$i" "$DOTFILES_BACKUP_FOLDER/$i"
    echo "Backed up current $i configuration to $DOTFILES_BACKUP_FOLDER/$i"
  fi

  ln -s "$DOTFILES/config/$i" -t "$HOME/.config/"
  printf "\nInstalled $i configuration\n\n"
done

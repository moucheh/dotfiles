#!/bin/bash

# change this variable to the dotfiles directory
DOTFILES=$HOME/.dotfiles
SCRIPTS=$DOTFILES/scripts

DOTFILES_BACKUP_FOLDER="$HOME/.backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p $DOTFILES_BACKUP_FOLDER

chmod +x $SCRIPTS/install/*.sh
chmod +x $SCRIPTS/nvdash_art.sh

$SCRIPTS/install/config.sh $DOTFILES $DOTFILES_BACKUP_FOLDER

$SCRIPTS/install/hidden.sh $DOTFILES $DOTFILES_BACKUP_FOLDER

printf "Configs installed\n\nContinuing...\n\n"

$SCRIPTS/install/dependencies.sh

$SCRIPTS/install/swaylock-effects.sh

$SCRIPTS/install/pam-swaylock.sh $DOTFILES $DOTFILES_BACKUP_FOLDER

$SCRIPTS/install/eza.sh

$SCRIPTS/install/zoxide.sh

$SCRIPTS/install/starship.sh

$SCRIPTS/install/nerdfont.sh

$SCRIPTS/install/nvdash_username.sh $DOTFILES

printf "\nSetup finished, enjoy!\nNote: You may want to reload your sway config, default keybind is Win+Shift+C\n"

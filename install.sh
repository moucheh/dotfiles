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
  nwg-dock
  nwg-drawer
)

for i in "${CONFIG_FOLDERS[@]}"; do
  if [ -e "$HOME/.config/$i" ]; then
    mv "$HOME/.config/$i" "$HOME/$BACKUP_FOLDER/$i"
    echo "Backed up current $i configuration to $BACKUP_FOLDER/$i"
  fi
  ln -s "$HOME/.dotfiles/$i/" -t "$HOME/.config/"
  printf "\nInstalled $i configuration\n\n"
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
    printf "\nInstalled starship configuration\n\n"
    continue
  fi

  if [ -e "$HOME/$i" ]; then
    mv "$HOME/$i" "$HOME/$BACKUP_FOLDER/$i"
    echo "Backed up current $i configuration to $BACKUP_FOLDER/$i"
  fi
  ln -s "$HOME/.dotfiles/$i" -t "$HOME"
  printf "\nInstalled $i configuration\n\n"
done

printf "Configs installed\n\nContinuing...\n\n"

read -n1 -p "Do you want to install swaylock-effects fork using dnf? (requires sudo) [y/n]: " doit
case $doit in
  y|Y)
    echo;
    sudo dnf copr enable trs-sod/swaylock-effects
    sudo rpm -e --nodeps swaylock
    sudo dnf install swaylock-effects
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
esac

read -n1 -p "Do you want to install dependencies dnf? (requires sudo) [y/n]: " doit
case $doit in
  y|Y)
    echo;
    sudo dnf install sway git nvim\
      waybar ranger tmux clangd clang clang++ cargo\
      gcc g++ foot fuzzel lazygit nwg-drawer nwg-dock\
      dunst nodejs npm python3 pip
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
esac

read -n1 -p "Do you want to install the autotiling script using pip? [y/n]: " doit
case $doit in
  y|Y)
    echo;
    pip install autotiling
    chmod +x $(which autotiling)
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
esac

read -n1 -p "Do you want to install eza as the ls replacement using cargo? [y/n]: " doit
case $doit in
  y|Y)
    echo;
    cargo install eza
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
esac

read -n1 -p "Do you want to install sddm-greeter theme? (requires sudo) [y/n]: " doit
case $doit in
  y|Y)
    echo;
    sudo cp -r 03-sway-fedora /usr/share/sddm/themes/
    sudo rm /etc/sddm.conf
    sudo cp sddm.conf /etc/
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
esac

read -n1 -p "Do you want to install pam.d swaylock config to enable password entry? (requires sudo) [y/n]: " doit
case $doit in
  y|Y)
    echo;
    sudo rm /etc/pam.d/swaylock
    sudo cp pam.d/swaylock /etc/pam.d/
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
esac

printf "\nSetup finished, enjoy!\n"

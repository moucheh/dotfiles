#!/bin/bash

BACKUP_FOLDER=".backup_$(date +%Y%m%d_%H%M%S)"

mkdir -p "$HOME/$BACKUP_FOLDER"

CONFIG_FOLDERS=(
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
  starship.toml
)

for i in "${CONFIG_FOLDERS[@]}"; do
  if [ "$i" == "starship.toml" ]; then
    if [ -e "$HOME/.config/starship.toml" ]; then
      mv "$HOME/.config/starship.toml" "$HOME/$BACKUP_FOLDER/starship.toml"
      echo "Backed up current starship configuration to $BACKUP_FOLDER/$i"
    fi
    ln -s "$HOME/.dotfiles/config/starship.toml" -t "$HOME/.config/"
    printf "\nInstalled starship configuration\n\n"
    continue
  fi

  if [ -e "$HOME/.config/$i" ]; then
    mv "$HOME/.config/$i" "$HOME/$BACKUP_FOLDER/$i"
    echo "Backed up current $i configuration to $BACKUP_FOLDER/$i"
  fi
  ln -s "$HOME/.dotfiles/config/$i" -t "$HOME/.config/"
  printf "\nInstalled $i configuration\n\n"
done

CONFIG_FILES=(
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

for i in "${CONFIG_FILES[@]}"; do
  if [ -e "$HOME/.$i" ]; then
    mv "$HOME/.$i" "$HOME/$BACKUP_FOLDER/$i"
    echo "Backed up current $i configuration to $BACKUP_FOLDER/$i"
  fi
  ln -s "$HOME/.dotfiles/hidden/$i" "$HOME/.$i"
  printf "\nInstalled $i configuration\n\n"
done

printf "Configs installed\n\nContinuing...\n\n"

read -n1 -p "Do you want to install dependencies using dnf? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    sudo dnf install sway git nvim\
      waybar tmux clangd clang clang++ cargo\
      gcc g++ foot fuzzel lazygit nwg-drawer nwg-dock\
      dunst nodejs npm python3 pip fzf
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

read -n1 -p "Do you want to install swaylock-effects fork using dnf? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    sudo dnf copr enable trs-sod/swaylock-effects
    sudo rpm -e --nodeps swaylock
    sudo dnf install swaylock-effects
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

read -n1 -p "Do you want to install the autotiling script using pip? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    pip install autotiling
    chmod +x $(which autotiling)
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

read -n1 -p "Do you want to install eza as the ls replacement using cargo? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    cargo install eza
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

read -n1 -p "Do you want to install zoxide as the cd replacement using cargo? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    cargo install zoxide
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

read -n1 -p "Do you want to install starship to customize your prompt? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    curl -sS https://starship.rs/install.sh | sh
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

read -n1 -p "Do you want to install sddm-greeter theme? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    sudo cp -r 03-sway-fedora /usr/share/sddm/themes/
    sudo mv /etc/sddm.conf "$HOME/$BACKUP_FOLDER/sddm.conf"
    sudo cp etc/sddm.conf /etc/
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

read -n1 -p "Do you want to install pam.d swaylock config to enable password entry? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    sudo mv /etc/pam.d/swaylock "$HOME/$BACKUP_FOLDER/swaylock"
    sudo cp etc/pam.d/swaylock /etc/pam.d/
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

read -n1 -p "Do you want to download and install CascaydiaCove Nerd Font? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
    cd ~/.local/share/fonts/
    unzip -qq CascadiaCode.zip
    rm CascadiaCode.zip README.md LICENSE
    fc-cache -fv
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac


read -n1 -p "Do you want to generate custom nvdash art from your username? [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    $HOME/.dotfiles/scripts/nvdash_art.sh $USER
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

printf "\nSetup finished, enjoy!\nNote: You may want to reload your sway config, default keybind is Win+Shift+C\n"

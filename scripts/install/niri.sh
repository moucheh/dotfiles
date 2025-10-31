#!/bin/bash

read -n1 -p "Do you want to install Niri and all of its dependencies with dnf as well? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
      sudo dnf copr enable yalter/niri
      sudo dnf install niri waybar fuzzel mate-polkit swaybg swaylock-effects wlsunset clipman dunst blueman-applet nm-applet  wl-clipboard
      ln -s ~/.dotfiles/config/niri ~/.config
      printf "You can now select niri from your login manager as a session\n\n"
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

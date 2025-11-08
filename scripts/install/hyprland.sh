#!/bin/bash

read -n1 -p "Do you want to install Hyprland and all of its dependencies with dnf as well? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
      sudo dnf install hyprland waybar fuzzel mate-polkit swaybg swaylock-effects wlsunset clipman dunst blueman-applet nm-applet  wl-clipboard
      ln -s ~/.dotfiles/config/hypr ~/.config
      printf "You can now select hyprland from your login manager as a session\n\n"
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

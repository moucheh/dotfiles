#!/bin/bash

read -n1 -p "Do you want to install dependencies using xbps? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    sudo xbps-install -S niri foot fuzzel fastfetch eza\
      lazygit gtklock lavalauncher neovim nwg-launchers\
      qt5ct qt6ct starship SwayNotificationCenter SwayOSD\
      Waybar wlogout yazi git gcc clang python3 tmux\
      cargo rust go cava gdm kdeconnect pulseaudio\
      pipewire pipewire wireplumber mpv imv evince\
      flatpak nautilus ncdu btop zoxide fzf ripgrep fd\
      xdg-utils xgd-user-dirs xdg-desktop-portal\
      xdg-desktop-portal-gnome xdg-desktop-portal-gtk

    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    flatpak install flathub com.brave.Browser
    flatpak install flathub io.freetubeapp.FreeTube
    flatpak install flathub com.github.wwmm.easyeffects
    flatpak install flathub org.gnome.Snapshot
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac

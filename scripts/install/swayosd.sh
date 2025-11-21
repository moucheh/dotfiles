#!/bin/bash

read -n1 -p "Do you want to install swayosd using dnf? (requires sudo) [Y/n]: " doit
case $doit in
  y|Y|'')
    echo;
    sudo dnf install meson libtk4 sassc gtk-devel libinput-devel gtk4-layer-shell-devel
    git clone https://github.com/ErikReider/SwayOSD /tmp/swayosd
    cur_pwd=$(pwd)
    cd /tmp/swayosd
    meson setup build
    ninja -C build
    meson install -C build
    cd $cur_pwd
    ln -s ~/.dotfiles/config/swayosd ~/.config
    ;;
  n|N) printf "\n\nContinuing...\n\n";;
  *) printf "\n\nInvalid option\n\n";;
esac


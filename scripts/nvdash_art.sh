#!/bin/bash

DOTFILES=$2
DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

SCRIPTS=$DOTFILES/scripts

figlet -f $SCRIPTS/ansi_shadow.flf $1 > ascii_art.txt

sed -i '1i\' ascii_art.txt

sed -i "s/^/' /; s/\$/ ',/" ascii_art.txt

sed -i '1i header = {' ascii_art.txt

sed -i '$a },\n' ascii_art.txt

cp $DOTFILES/config/nvim/lua/chadrc.lua $DOTFILES/config/nvim/lua/chadrc.lua.bak

printf "\nchadrc.lua file backed up to $DOTFILES/config/nvim/chadrc.lua.bak\n"

sed -i '/header = {/,/},/d' $DOTFILES/config/nvim/lua/chadrc.lua

sed -i '/M.nvdash = {/r ascii_art.txt' $DOTFILES/config/nvim/lua/chadrc.lua


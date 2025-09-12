#!/bin/bash
figlet -f ~/.dotfiles/ansi_shadow.flf $1 > ascii_art.txt

sed '1i\' ascii_art.txt
sed -i "s/^/'/; s/\$/',/" ascii_art.txt
sed -i '1i header = {\n' ascii_art.txt
sed -i '$a },\n' ascii_art.txt

sed -i '/header = {/,/},/d' ~/.dotfiles/nvim/lua/chadrc.lua

sed -i '/M.nvdash = {/r ascii_art.txt' ~/.dotfiles/nvim/lua/chadrc.lua
rm ascii_art.txt

#!/bin/bash
figlet -f ~/.dotfiles/ansi_shadow.flf $1 > /tmp/ascii_art.txt

sed -i '1i\' /tmp/ascii_art.txt

sed -i "s/^/' /; s/\$/ ',/" /tmp/ascii_art.txt

sed -i '1i header = {' /tmp/ascii_art.txt

sed -i '$a },\n' /tmp/ascii_art.txt

sed -i '/header = {/,/},/d' ~/.dotfiles/nvim/lua/chadrc.lua

sed -i '/M.nvdash = {/r /tmp/ascii_art.txt' ~/.dotfiles/nvim/lua/chadrc.lua
rm /tmp/ascii_art.txt

if command -v stylua >/dev/null 2>&1; then
  stylua ~/.dotfiles/nvim/lua/chadrc.lua
else
  ~/.local/share/nvim/mason/bin/stylua ~/.dotfiles/nvim/lua/chadrc.lua
fi

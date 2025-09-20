#!/bin/bash
figlet -f ~/.dotfiles/scripts/ansi_shadow.flf $1 > ascii_art.txt

sed -i '1i\' ascii_art.txt

sed -i "s/^/' /; s/\$/ ',/" ascii_art.txt

sed -i '1i header = {' ascii_art.txt

sed -i '$a },\n' ascii_art.txt

cp ~/.dotfiles/config/nvim/lua/chadrc.lua ~/.dotfiles/config/nvim/lua/chadrc.lua.bak

printf "\nchadrc.lua file backed up to ~/.dotfiles/config/nvim/chadrc.lua.bak\n"

sed -i '/header = {/,/},/d' ~/.dotfiles/config/nvim/lua/chadrc.lua

sed -i '/M.nvdash = {/r ascii_art.txt' ~/.dotfiles/config/nvim/lua/chadrc.lua

if command -v stylua >/dev/null 2>&1; then
  stylua ~/.dotfiles/config/nvim/lua/chadrc.lua
else
  if [ -f ~/.local/share/nvim/mason/bin/stylua ]; then
    ~/.local/share/nvim/mason/bin/stylua ~/.dotfiles/config/nvim/lua/chadrc.lua
  fi
fi

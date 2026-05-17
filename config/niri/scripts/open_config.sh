#!/bin/env bash

eval $(keychain -q --eval gh_key)
nvim --cmd "cd ~/.config/niri" ~/.config/niri/config.kdl

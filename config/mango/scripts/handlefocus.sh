#!/bin/env bash

mode=$(mmsg -g -o eDP-1 -l | awk '{print $2}')

if [ "$mode" == "S" ]; then
  if [ "$1" == "down" ]; then
    mmsg -d viewtoright
  else
    mmsg -d viewtoleft
  fi
else
  mmsg -d focusdir,$1
fi

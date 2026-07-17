#!/bin/env bash

CONFIG_PATH="$HOME/.config/niri"

if [ "$1" == "enable" ]; then
    CONFIG_PATH="$CONFIG_PATH/gaming-mode.kdl"
    ACTION="Enabled"
else
    CONFIG_PATH="$CONFIG_PATH/config.kdl"
    ACTION="Disabled"
fi

niri msg action load-config-file --path $CONFIG_PATH
notify-send -i heroic "Gaming Mode" $ACTION

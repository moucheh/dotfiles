#!/bin/bash

arg=$1

curr_vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
new_vol=$(echo "$curr_vol + $arg" | bc -l)

is_over_one=$(echo "$new_vol> 1" | bc -l)

if [[ "$is_over_one" -eq 1 ]]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 1
else
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$new_vol"
fi

/usr/libexec/sway/volume-helper

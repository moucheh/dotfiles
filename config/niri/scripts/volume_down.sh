#!/bin/bash

arg=$1

curr_vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
new_vol=$(echo "$curr_vol - $arg" | bc -l)

is_neg=$(echo "$new_vol < 0" | bc -l)

if [[ "$is_neg" -eq 1 ]]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0
else
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$new_vol"
fi

/usr/libexec/sway/volume-helper

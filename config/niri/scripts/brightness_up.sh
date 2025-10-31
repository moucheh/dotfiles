#!/bin/bash

brightnessctl --class=backlight set 5%+
PERCENTAGE=$(brightnessctl -P g)

notify-send -e -h string:x-canonical-private-synchronous:brightness \
    -h "int:value:$PERCENTAGE" -t 800 "Brightness: ${PERCENTAGE}%"

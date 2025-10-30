#!/bin/bash

PERCENTAGE=$(brightnessctl -P g)

notify-send -e -h string:x-canonical-private-synchronous:brightness \
    -h "int:value:$PERCENTAGE" -t 800 "Brightness: ${PERCENTAGE}%"

#!/bin/bash

if ! [ -f /tmp/bluetooth_volume ]; then
  touch /tmp/bluetooth_battery
fi

echo "$(upower -i $(upower -e | grep headset) | grep percentage | awk '{print $2}')" >/tmp/bluetooth_battery

cat /tmp/bluetooth_battery

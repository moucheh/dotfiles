#!/bin/bash

set +e

# some env can't auto run the portal, so need this
/usr/lib/xdg-desktop-portal-wlr  >/dev/null 2>&1 &

# notify
swaync >/dev/null 2>&1 &

# night light
wlsunset -l 44.5 -L 18.6 -t 4500 -T 6500 >/dev/null 2>&1 &

# wallpaper
swaybg -i ~/.dotfiles/images/waves.jpg >/dev/null 2>&1 &

# top bar
waybar -c ~/.config/mango/waybar/config.jsonc -s ~/.config/mango/waybar/style.css >/dev/null 2>&1 &

kdeconnect-indicator >/dev/null 2>&1 &

wl-paste -t text --watch clipman store >/dev/null 2>&1 &

clipman restore

/usr/libexec/polkit-mate-authentication-agent-1 >/dev/null 2>&1 &

# xwayland dpi scale
echo "Xft.dpi: 140" | xrdb -merge #dpi缩放
# xrdb merge ~/.Xresources >/dev/null 2>&1

# bluetooth
blueman-applet >/dev/null 2>&1 &

# network
nm-applet >/dev/null 2>&1 &

# change light value and volume value by swayosd-client in keybind
swayosd-server >/dev/null 2>&1 &

lavalauncher >/dev/null 2>&1 &

dex --environment mango --autostart --search-paths ~/.config/autostart

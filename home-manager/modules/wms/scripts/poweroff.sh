#!bash

which rofi

rofi \
  -show power-menu \
  -modi power-menu:~/.config/waybar/scripts/rofi-power-menu.sh \
  -theme-str 'window {width: 9em;} listview {lines: 6;}'
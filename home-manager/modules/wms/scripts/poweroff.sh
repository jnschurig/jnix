#!bash

echo "Running poweroff.sh"
which rofi
echo "Arguments: -show power-menu -modi power-menu:~/.config/waybar/scripts/rofi-power-menu.sh -theme-str 'window {width: 8em;} listview {lines: 6;}'"

rofi \
  -show power-menu \
  -modi power-menu:~/.config/waybar/scripts/rofi-power-menu.sh \
  -theme-str 'window {width: 9em;} listview {lines: 6;}'
#!/bin/bash
rofi \
  -show power-menu \
  -modi power-menu:~/.config/waybar/scripts/rofi-power-menu.sh

# rofi \
#   -show p \
#   -modi p:'~/.config/waybar/scripts/rofi-power-menu.sh --symbols-font "Symbols Nerd Font Mono"' \
#   -font "JetBrains Mono NF 16" \
#   -theme Paper \
#   -theme-str 'window {width: 8em;} listview {lines: 6;}'

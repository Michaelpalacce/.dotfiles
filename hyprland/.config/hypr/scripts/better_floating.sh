#!/bin/bash

WINDOW_ADDRESS=$(hyprctl activewindow -j | jq -r '.address')
IS_FLOATING=$(hyprctl clients -j | jq -r --arg addr "$WINDOW_ADDRESS" '.[] | select(.address == $addr) | .floating')

if [ "$IS_FLOATING" = "true" ]; then
    hyprctl dispatch settiled
else
    hyprctl dispatch setfloating
    hyprctl dispatch resizeactive exact 50% 92%
    hyprctl dispatch moveactive 0 5%
    hyprctl dispatch centerwindow 1
fi

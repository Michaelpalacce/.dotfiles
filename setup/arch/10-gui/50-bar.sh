#!/usr/bin/env bash

if [[ "$MINIMAL" == false ]]; then
    # Waybar
    yay --noconfirm -S --needed waybar dunst eww
fi
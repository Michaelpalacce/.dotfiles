#!/usr/bin/env bash

if [[ "$MINIMAL" == false ]]; then
    # App Launcher
    yay --noconfirm -S --needed rofi rofi-emoji-git hyprworm
fi

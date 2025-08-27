#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    # App Launcher
    yay --noconfirm -S --needed sherlock-launcher-bin rofi
fi


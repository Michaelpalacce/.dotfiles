#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    echo "YOU WILL BE PROMPTED FOR PASSWORD A FEW TIMES!"
    hyprpm update
    yes | hyprpm add https://github.com/hyprwm/hyprland-plugins
    hyprpm enable hyprbars
fi

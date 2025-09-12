#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    read -p "Do you want hyprbars?" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "YOU WILL BE PROMPTED FOR PASSWORD A FEW TIMES!"
        hyprpm update
        yes | hyprpm add https://github.com/hyprwm/hyprland-plugins
        hyprpm enable hyprbars
    else
        hyprpm disable hyprbars
    fi
fi

#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    yay --noconfirm -S waybar swww catpuccin-gtk-theme-mocha nwg-look gtkmm3 qt6-svg qt6-declarative qt5-quickcontrols2 waycorner brightnessctl

    # hyprland utils
    yay --noconfirm -S hyprutils hyprgraphics qt5-wayland qt6-wayland xdg-desktop-portal-hyprland \
        hyprpolkitagent hyprsysteminfo hypridle hyprlock hyprshot hyprpicker lm_sensors hyprviz-bin

    # Wallpaper
    yay --noconfirm -S waypaper
fi

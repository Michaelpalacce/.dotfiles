#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    yay --noconfirm -S --needed catppuccin-gtk-theme-mocha nwg-look gtkmm3 qt6-svg qt6-declarative qt5-quickcontrols2 waycorner brightnessctl swww

    # hyprland utils
    yay --noconfirm -S --needed hyprutils-git hyprgraphics qt5-wayland qt6-wayland xdg-desktop-portal-hyprland \
        hyprpolkitagent hyprsysteminfo hypridle-git hyprlock-git hyprshot-git hyprpicker-git lm_sensors hyprviz-bin

    # Wallpaper
    yay --noconfirm -S --needed waypaper
fi
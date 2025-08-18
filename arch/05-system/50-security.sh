#!/usr/bin/env bash


if [ "$MINIMAL" == false ]; then
    # System Resources
    yay --noconfirm -S --needed resources gnome-system-monitor

    # Logout
    yay --noconfirm -S --needed wlogout
fi

# Security
yay --noconfirm -S --needed firejail ufw ufw-docker

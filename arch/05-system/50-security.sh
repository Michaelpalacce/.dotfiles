#!/usr/bin/env bash


if [ "$MINIMAL" == false ]; then
    # System Resources
    yay --noconfirm -S resources gnome-system-monitor

    # Logout
    yay --noconfirm -S wlogout
fi

# Security
yay --noconfirm -S firejail ufw

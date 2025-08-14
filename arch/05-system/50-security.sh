#!/usr/bin/env bash


if [ "$MINIMAL" == false ]; then
    # System Resources
    yay --noconfirm -Su resources gnome-system-monitor

    # Logout
    yay --noconfirm -Su wlogout
fi

# Security
yay --noconfirm -Su firejail

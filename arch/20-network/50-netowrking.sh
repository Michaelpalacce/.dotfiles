#!/usr/bin/env bash

# Networking
yay --noconfirm -S --needed networkmanager

if [ "$MINIMAL" == false ]; then
    # Networking
    yay --noconfirm -S --needed networkmanager-dmenu-git
fi

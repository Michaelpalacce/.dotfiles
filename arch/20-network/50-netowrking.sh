#!/usr/bin/env bash

# Networking
yay --noconfirm -S networkmanager

if [ "$MINIMAL" == false ]; then
    # Networking
    yay --noconfirm -S networkmanager-dmenu-git
fi

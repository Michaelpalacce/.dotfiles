#!/usr/bin/env bash

# Networking
yay --noconfirm -Su networkmanager

if [ "$MINIMAL" == false ]; then
    # Networking
    yay --noconfirm -Su networkmanager-dmenu-git
fi

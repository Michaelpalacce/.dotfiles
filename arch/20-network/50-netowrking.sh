#!/usr/bin/env bash

# Networking... bind has tools like nslookup
yay --noconfirm -S --needed networkmanager bind dnsmasq

if [ "$MINIMAL" == false ]; then
    # Networking
    yay --noconfirm -S --needed networkmanager-dmenu-git
fi

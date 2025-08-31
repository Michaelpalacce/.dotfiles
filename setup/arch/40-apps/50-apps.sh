#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    # Flatpak cause I am a baby
    yay --noconfirm -S --needed flatpak
fi

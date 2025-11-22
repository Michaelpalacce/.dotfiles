#!/usr/bin/env bash

if [[ "$MINIMAL" == false ]]; then
    # Audio
    yay --noconfirm -S --needed pipewire pipewire-pulse wireplumber pavucontrol lib32-pipewire alsa-utils libcava
fi
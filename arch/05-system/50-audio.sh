#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    # Audio
    yay --noconfirm -Su pipewire pipewire-pulse wireplumber pavucontrol lib32-pipewire alsa-utils
fi


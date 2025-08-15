#!/usr/bin/env bash

yay --noconfirm -S sof-firmware 

if [ "$MINIMAL" == false ]; then
    # GUI drivers
    yay --noconfirm -S egl-x11 lib32-nvidia-utils nvidia-open
fi

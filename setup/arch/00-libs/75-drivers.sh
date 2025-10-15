#!/usr/bin/env bash

yay --noconfirm -S --needed sof-firmware

if [ "$MINIMAL" == false ]; then
    # GUI drivers
    yay --noconfirm -S --needed egl-x11 lib32-nvidia-utils nvidia-open
fi
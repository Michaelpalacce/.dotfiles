#!/usr/bin/env bash

yay --noconfirm -Su sof-firmware 

if [ "$MINIMAL" == false ]; then
    # GUI drivers
    yay --noconfirm -Su lib32-nvidia-utils nvidia-open
fi

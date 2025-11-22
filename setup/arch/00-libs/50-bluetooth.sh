#!/usr/bin/env bash

# bluetooth protocol stack and utils
yay --noconfirm -S --needed bluez bluez-utils

if [[ "$MINIMAL" == false ]]; then
    # Blueman is a GUI app for bluetooth management
    yay --noconfirm -S --needed blueman
fi
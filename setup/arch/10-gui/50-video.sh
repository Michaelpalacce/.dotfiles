#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    # Video
    yay --noconfirm -S --needed gifski vlc vlc-plugins-all
fi


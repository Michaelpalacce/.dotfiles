#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    # Video
    yay --noconfirm -Su gifski vlc vlc-plugins-all
fi


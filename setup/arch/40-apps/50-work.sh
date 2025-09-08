#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    yay --noconfirm -S --needed slack-desktop
fi

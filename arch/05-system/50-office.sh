#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
    # Office apps
    yay --noconfirm -S --needed libreoffice
fi

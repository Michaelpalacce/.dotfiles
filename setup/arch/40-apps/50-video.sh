#!/usr/bin/env bash

if [[ "$MINIMAL" == false ]]; then
    yay --noconfirm -S --needed gpu-screen-recorder
fi
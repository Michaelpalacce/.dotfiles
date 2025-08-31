#!/usr/bin/env bash

# Gemini
yay --noconfirm -S gemini-cli-bin

if [ "$MINIMAL" == false ]; then
    yay --noconfirm -S --needed lmstudio
fi

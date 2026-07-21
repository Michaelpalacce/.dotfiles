#!/usr/bin/env bash

# Gemini
yay --noconfirm -S gemini-cli-bin

yay --noconfirm -S opencode-bin claude-code cursor-cli

if [[ "$MINIMAL" == false ]]; then
    yay --noconfirm -S --needed lmstudio
fi
#!/usr/bin/env bash

if [[ "$MINIMAL" == false ]]; then
    # PKM
    yay --noconfirm -S --needed obsidian arch-wiki-docs
fi
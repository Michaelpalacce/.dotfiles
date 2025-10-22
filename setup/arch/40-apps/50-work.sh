#!/usr/bin/env bash

yay --noconfirm -S --needed gnome-pomodoro

if [ "$MINIMAL" == false ]; then
    yay --noconfirm -S --needed slack-desktop
fi
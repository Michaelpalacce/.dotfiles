#!/usr/bin/env bash

if [ "$MINIMAL" == false ]; then
  yay -S --noconfirm --needed syncthing
fi
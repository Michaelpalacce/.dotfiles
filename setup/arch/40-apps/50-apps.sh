#!/usr/bin/env bash

if [[ "$MINIMAL" == false ]]; then
  yay -S --needed --noconfirm wayscriber
fi
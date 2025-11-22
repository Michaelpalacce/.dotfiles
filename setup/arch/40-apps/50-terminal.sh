#!/usr/bin/env bash

# terminal
yay --noconfirm -S --needed fastfetch htop ticker-bin gum

if [[ "$MINIMAL" == false ]]; then
  echo ""
fi
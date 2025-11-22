#!/usr/bin/env bash

# terminal
yay --noconfirm -S --needed fastfetch htop ticker-bin gum-git

if [[ "$MINIMAL" == false ]]; then
  echo ""
fi
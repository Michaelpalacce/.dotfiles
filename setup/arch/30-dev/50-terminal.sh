#!/usr/bin/env bash

# terminal
yay --noconfirm -S --needed eza tmux zsh stow

if [[ "$MINIMAL" == false ]]; then
  echo ""
fi
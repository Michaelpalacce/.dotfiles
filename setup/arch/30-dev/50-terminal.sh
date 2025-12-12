#!/usr/bin/env bash

# terminal
yay --noconfirm -S --needed eza tmux zsh stow alacritty

if [[ "$MINIMAL" == false ]]; then
  echo ""
fi
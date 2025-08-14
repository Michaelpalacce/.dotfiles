#!/usr/bin/env bash

# Dev
yay --noconfirm -Su tmux zsh stow aws-cli-v2


if [ "$MINIMAL" == false ]; then
    # Postman GUI app
    yay --noconfirm -Su postman-bin
fi

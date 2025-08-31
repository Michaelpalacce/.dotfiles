#!/usr/bin/env bash

if [[ $machine == "Linux" ]]; then
    . $HOME/.dotfiles/setup-arch.sh
elif [[ $machine == "Mac" ]]; then
    . $HOME/.dotfiles/setup-mac.sh
else
    echo "$RED" "What machine are you on?"
    exit 1
fi

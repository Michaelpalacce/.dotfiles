#!/usr/bin/env bash

if [[ $machine == "Linux" ]]; then
    . $HOME/.dotfiles/setup/setup-arch.sh
elif [[ $machine == "Mac" ]]; then
    . $HOME/.dotfiles/setup/setup-mac.sh
else
    echo "$RED" "What machine are you on?"
    exit 1
fi

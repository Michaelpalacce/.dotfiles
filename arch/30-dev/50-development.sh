#!/usr/bin/env bash

# Dev
yay --noconfirm -S --needed tmux zsh stow aws-cli-v2 nvim fnm terraform ansible ripgrep sops age fzf fd


if [ "$MINIMAL" == false ]; then
    # Postman GUI app
    yay --noconfirm -S --needed postman-bin
fi

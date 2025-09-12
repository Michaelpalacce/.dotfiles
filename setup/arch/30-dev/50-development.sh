#!/usr/bin/env bash

# Dev
yay --noconfirm -S --needed aws-cli-v2 nvim fnm terraform ansible ripgrep fzf fd direnv vault-bin golangci-lint

if [ "$MINIMAL" == false ]; then
    # Postman GUI app
    yay --noconfirm -S --needed postman-bin
fi

#!/usr/bin/env bash

# Dev
yay --noconfirm -S --needed aws-cli-v2 nvim fnm terraform ansible vault-bin golangci-lint github-cli chart-testing

# Utils
yay --noconfirm -S --needed ripgrep fzf fd direnv yq jq

if [ "$MINIMAL" == false ]; then
    # Postman GUI app
    yay --noconfirm -S --needed postman-bin
fi

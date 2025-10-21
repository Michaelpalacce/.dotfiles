#!/usr/bin/env bash

# Dev
yay --noconfirm -S --needed aws-cli-v2 nvim fnm terraform ansible vault-bin github-cli chart-testing google-cloud-cli

# Utils
yay --noconfirm -S --needed ripgrep fzf fd direnv go-yq jq

if [ "$MINIMAL" == false ]; then
    # Postman GUI app
    yay --noconfirm -S --needed postman-bin
fi
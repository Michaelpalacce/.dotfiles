#!/usr/bin/env bash

if [[ "$MINIMAL" == false ]]; then
    # Dev
    # `mariadb-git` is giant...
    yay --noconfirm -S --needed mariadb
fi
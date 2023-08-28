#!/bin/bash

apt install -y ripgrep
apt install -y stow

for dir in */ ; do
    echo "stow $dir"
    stow $dir
done

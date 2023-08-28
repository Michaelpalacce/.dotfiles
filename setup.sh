#!/bin/bash

apt install -y ripgrep
apt install -y stow

FOLDERS=("nvim")

for dir in ${FOLDERS[@]} ; do
    echo "stow $dir"
    stow $dir
done

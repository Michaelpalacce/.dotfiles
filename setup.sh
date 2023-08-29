#!/bin/bash

FOLDERS=("nvim" "editorconfig" "bashrc")

for dir in ${FOLDERS[@]} ; do
    echo "stow $dir"
    stow $dir
done

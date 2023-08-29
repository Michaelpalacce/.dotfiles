#!/bin/bash


FOLDERS=("nvim" "editorconfig")

for dir in ${FOLDERS[@]} ; do
    echo "stow $dir"
    stow $dir
done

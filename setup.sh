#!/bin/bash


FOLDERS=("nvim")

for dir in ${FOLDERS[@]} ; do
    echo "stow $dir"
    stow $dir
done

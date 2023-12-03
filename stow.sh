#!/usr/bin/env bash
#
FOLDERS=("nvim" "editorconfig" "sh" "tmux" "bin")
sudo apt-get install -y stow

for dir in ${FOLDERS[@]} ; do
    echo "stow $dir"
    stow $dir
done

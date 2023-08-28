#!/bin/bash

for dir in */ ; do
    echo "stow $dir"
    stow $dir
done

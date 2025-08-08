#!/usr/bin/env bash

# ------------------------ Post Setup -------------------------------
# This script is run after the main setup script. 
# It contains OS specific setup and other things that should be run after the main setup script.

# Mac specifics
if [[ "$machine" = "Mac" ]]; then
    # Run macos.sh for some nice defaults
    . $HOME/.dotfiles/scripts/os/mac.sh
fi

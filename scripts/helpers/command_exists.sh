#!/usr/bin/env bash

# ------------------------------------------------
#
# Helper function to check if a command is available
#
# Arguments:
# $1: The command to check
#
# Example: `command_exists git`
#
# ------------------------------------------------

# Function to check if a command is available
# https://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script
command_exists() {
  command -v "$1" >/dev/null 2>&1
}


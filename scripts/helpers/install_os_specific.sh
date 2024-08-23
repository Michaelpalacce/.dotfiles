#!/usr/bin/env bash

# ------------------------------------------------
#
# Helper function to install packages based on the OS
#
# Arguments:
#  $1: The package to install
#
# Example: `installOsSpecific git`
#
# ------------------------------------------------

installOsSpecific() {
    if command_exists apt-get; then
        print_color "$GREEN" "Setting up"
        sudo apt-get install -y "$1"
    elif command_exists brew; then 
        brew install "$1"
    else
        print_color "$RED" "Error: No package manager found"
        exit 1
    fi
}

#!/usr/bin/env bash

# ------------------------------------------------
#
# Helper function to fetch the OS.
# The script will set the variable `machine` to the OS name.
#
# Options:
# - Linux
# - Mac
# - UNKNOWN:unameOut
#
# Arguments:
# None
#
# ------------------------------------------------

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

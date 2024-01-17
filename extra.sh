#!/usr/bin/env bash
# Extra contains some extra tools to make everything work right, but these are not critical

# Function to check if a command is available
# https://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    MSYS_NT*)   machine=Git;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [[ "$machine" = "Linux" ]]; then
    if ! command_exists timer; then
        echo 'deb [trusted=yes] https://repo.caarlos0.dev/apt/ /' | sudo tee /etc/apt/sources.list.d/caarlos0.list
        apt update
        apt install timer
    fi
fi

if [[ "$machine" = "Mac" ]]; then
    if ! command_exists timer; then
        brew install caarlos0/tap/timer terminal-notifier
    fi
fi
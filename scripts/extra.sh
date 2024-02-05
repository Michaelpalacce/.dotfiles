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
    *)          machine="UNKNOWN:${unameOut}"
esac

if ! command_exists cargo; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
fi

if [[ "$machine" = "Linux" ]]; then
    if ! command_exists timer; then
        echo 'deb [trusted=yes] https://repo.caarlos0.dev/apt/ /' | sudo tee /etc/apt/sources.list.d/caarlos0.list
        apt update
        apt install timer
    fi

    if ! command_exists exa; then
        brew install exa
    fi
fi


if [[ "$machine" = "Mac" ]]; then
    if ! command_exists timer; then
        brew install caarlos0/tap/timer terminal-notifier 
    fi

    if ! command_exists exa; then
        cargo install exa
    fi

    brew install gsed
fi

#!/usr/bin/env bash

# fd

if ! command_exists fd; then
    print_color "$GREEN" "fd missing, installing"

    if command_exists apt-get; then
        sudo apt install -y fd-find
        sudo ln -s $(which fdfind) /usr/local/bin/fd
    elif command_exists brew; then
        brew install fd
    else
        print_color "$RED" "Error: No package manager found"
        exit 1
    fi
else
    print_color "$YELLOW" "fd exists, skipping"
fi


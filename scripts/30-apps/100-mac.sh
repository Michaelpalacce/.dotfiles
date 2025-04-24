#!/usr/bin/env bash

# Mac Specific Apps

if command_exists brew; then
    print_color "$GREEN" "Installing mac apps"
    brew install --cask raycast # Better spotlight
    brew install --cask alt-tab # Linux-like alt-tab
else
    print_color "$YELLOW" "Skipping for non-mac"
fi

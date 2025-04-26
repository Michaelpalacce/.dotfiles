#!/usr/bin/env bash

# fzf is installed like this and outside of apt since it has an older version

if ! command_exists fzf; then
    print_color "$GREEN" "fzf missing, installing"
    # Install fzf
    # If you want to update, run the install command again, no need to git clone again of course
    if ! command_exists fzf; then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --completion --key-bindings --no-update-rc

        sudo ln -sf $HOME/.fzf/bin/fzf /usr/local/bin/fzf
    fi
else
    print_color "$YELLOW" "fzf exists, skipping"
fi


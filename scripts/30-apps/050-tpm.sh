#!/usr/bin/env bash

# TPM is a plugin manager for tmux
# This will install the plugin manager if it does not exist

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d $TPM_DIR ]; then 
    print_color "$YELLOW" "$TPM_DIR exists, updating"
    # Install tpm plugins
    $TPM_DIR/scripts/update_plugin.sh all all
else
    print_color "$GREEN" "$TPM_DIR does not exist, checking the repository out"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # Install tpm plugins
    $TPM_DIR/scripts/install_plugins.sh
fi

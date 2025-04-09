#!/usr/bin/env bash
#
# ----------------------------------------------------------------------------
# This script installs fnm if not installed
# ----------------------------------------------------------------------------

if ! command_exists fnm; then 
    curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell --install-dir $HOME/.fnm
    source ~/.zsh-config/dev/nodejs
fi

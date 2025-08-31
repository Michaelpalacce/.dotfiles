#!/usr/bin/env bash

# ------------------------ Variables -------------------------------

DOTFILES_DIR="$HOME/.dotfiles"

# Define some colors and symbols
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

SUCCESS="✅"
IN_PROGRESS="⏳"

# Helper function to print colored messages
log_step() {
    local color="$1"
    local message="$2"
    echo -e "${color}${message}${NC}"
}

# -------------------------- Installation ------------------------

pushd $DOTFILES_DIR
    TOTAL_STEPS=6
    STEP=1

    log_step "$YELLOW" "Installing libs now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./mac/00-libs/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))

    log_step "$YELLOW" "Installing system now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./mac/05-system/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))
    
    log_step "$YELLOW" "Installing gui now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./mac/10-gui/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))

    log_step "$YELLOW" "Installing network now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./mac/20-network/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))

    log_step "$YELLOW" "Installing dev now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./mac/30-dev/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))

    log_step "$YELLOW" "Installing apps now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./mac/40-apps/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))
popd

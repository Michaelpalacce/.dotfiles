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
#
# Default value for flags
MINIMAL=false
GAMING=false

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --minimal)
            MINIMAL=true
            ;;
        --gaming)
            MINIMAL=true
            ;;
        *)
            echo "Unknown option: $1"
            echo "valid:"
            echo "--minimal    Don't install gui apps"
            echo "--gaming     Install gaming-related stuff"
            exit 1
            ;;
    esac
    shift # Move to the next argument
done

if [ "$MINIMAL" == true ]; then
    echo "The --minimal flag is set. Running in minimal mode."
else
    echo "The --minimal flag is not set. Running in full mode."
fi

if [ "$GAMING" == true ]; then
    echo "The --gaming flag is set. Installing gaming-related stuff."
else
    echo "The --gaming flag is not set. Not installing gaming-related stuff."
fi

# -------------------------- Installation ------------------------

pushd $DOTFILES_DIR
    TOTAL_STEPS=6
    STEP=1

    log_step "$YELLOW" "Installing libs now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./setup/arch/00-libs/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))

    log_step "$YELLOW" "Installing system now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./setup/arch/05-system/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))
    
    log_step "$YELLOW" "Installing gui now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./setup/arch/10-gui/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))

    log_step "$YELLOW" "Installing network now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./setup/arch/20-network/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))

    log_step "$YELLOW" "Installing dev now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./setup/arch/30-dev/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))

    log_step "$YELLOW" "Installing apps now ${IN_PROGRESS} [${STEP}/$TOTAL_STEPS]"
    for script in ./setup/arch/40-apps/*; do
        . "$script" > /dev/null
    done
    log_step "$GREEN" "Done! ${SUCCESS}\n"
    ((STEP++))
popd
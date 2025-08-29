if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export ROFI_DIR="$HOME/.config/rofi/"
export EDITOR=nvim

export ROFI_DIR="$HOME/.config/rofi/"
export EDITOR=nvim

# MAC
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

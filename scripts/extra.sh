#!/usr/bin/env bash
# Extra contains some extra tools to make everything work right, but these are not critical

# Function to check if a command is available
# https://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# ANSI color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No color

# Function to print colored text
print_color() {
    local color="$1"
    local message="$2"
    echo -e "${color}${message}${NC}"
}

installNeovim() {
    if command_exists brew; then
        print_color "$GREEN" "nvim not found, installing"
        brew install neovim ripgrep fd
    elif command_exists apt-get; then
        print_color "$GREEN" "nvim not found, installing"
        # Install dependencies
        sudo apt-get install -y git software-properties-common ripgrep fd-find python3-dev python3-pip
        sudo ln -s $(which fdfind) ~/.local/bin/fd

        sudo add-apt-repository ppa:neovim-ppa/unstable -y

        sudo apt-get update
        sudo apt-get install -y neovim
    else
        print_color "$RED" "Error: No package manager found"
        exit 1
    fi
}

installAlacritty() {
    if command_exists brew; then
        print_color "$GREEN" "alacritty not found, installing"
        brew install --cask alacritty
    elif command_exists apt-get; then
        print_color "$GREEN" "alacritty not found, installing"
        sudo add-apt-repository ppa:aslatter/ppa -y
        sudo apt update
        sudo apt install -y alacritty
    else
        print_color "$RED" "Error: No package manager found"
        exit 1
    fi
}

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Install CARGO and rust
if ! command_exists cargo; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Install GOlang
if ! command_exists go; then
    zsh <(curl -sL https://git.io/go-installer)
    source "$HOME/.zshrc"
    rm -rf go*.tar.gz
fi

# Install fnm
if ! command_exists fnm; then
    cargo install fnm
fi

# Install fzf
if ! command_exists fzf; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --completion --key-bindings --no-update-rc
fi

# Install nvim
if ! command_exists nvim; then
    installNeovim
else
    print_color "$YELLOW" "nvim exists, skipping"
fi

if ! command_exists alacritty; then
    print_color "$GREEN" "alacritty not found, installing"
    installAlacritty
else
    print_color "$YELLOW" "alacritty exists, skipping"
fi

APTS=("tmux" "git" "zsh" "gh" "stow")

# Linux specifics
if [[ "$machine" = "Linux" ]]; then
    if ! command_exists timer; then
        echo 'deb [trusted=yes] https://repo.caarlos0.dev/apt/ /' | sudo tee /etc/apt/sources.list.d/caarlos0.list
        apt update
        apt install timer
    fi

    if ! command_exists nix; then
        sh <(curl -L https://nixos.org/nix/install) --daemon --yes
    fi

    # Basic packages
    for package in ${APTS[@]} ; do
        if ! command_exists $package; then
            print_color "$GREEN" "$package not found, installing"
            apt install -y $package
        else
            print_color "$YELLOW" "$package exists, skipping"
        fi
    done
fi

# Mac specifics
if [[ "$machine" = "Mac" ]]; then
    if ! command_exists timer; then
        brew install caarlos0/tap/timer terminal-notifier 
    fi

    if ! command_exists nix; then
        sh <(curl -L https://nixos.org/nix/install) --yes
    fi

    # Run macos.sh for some nice defaults
    . $HOME/.dotfiles/scripts/macos.sh

    brew install gsed

    # Basic packages
    for package in ${APTS[@]} ; do
        if ! command_exists $package; then
            print_color "$GREEN" "$package not found, installing"
            brew install $package
        else
            print_color "$YELLOW" "$package exists, skipping"
        fi
    done
fi

if [[ ! -d "$HOME/.config/home-manager/home.nix" ]]; then
    echo "Home Manager already installed"
else
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install
fi

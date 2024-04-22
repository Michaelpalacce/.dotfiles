#!/usr/bin/env zsh
# Extra contains some extra tools to make everything work right, but these are not critical

# Function to check if a command is available
# https://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script

command_exists() {
  command -v "$1" >/dev/null 2>&1
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

# Install exa
if ! command_exists exa; then
    cargo install exa
fi

# Install fzf
if ! command_exists fzf; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --completion --key-bindings --no-update-rc
fi

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

    ln -sf $HOME/.dotfiles/sh/.zshenv.d/linux $HOME/.zshenv
fi

# Mac specifics
if [[ "$machine" = "Mac" ]]; then
    if ! command_exists timer; then
        brew install caarlos0/tap/timer terminal-notifier 
    fi

    if ! command_exists nix; then
        sh <(curl -L https://nixos.org/nix/install) --yes
    fi

    brew install gsed
fi

if [[ ! -d "$HOME/.config/home-manager/home.nix" ]]; then
    echo "Home Manager already installed"
else
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install
fi

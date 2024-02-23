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

if ! command_exists cargo; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source "$HOME/.cargo/env"
fi

if ! command_exists go; then
    zsh <(curl -sL https://git.io/go-installer)
    source "$HOME/.zshrc"
    rm -rf go*.tar.gz

    # if [[ "$machine" = "Linux" ]]; then
    #     ln -sf $HOME/.dotfiles/sh/.zshenv.d/linux $HOME/.zshenv
    # fi
fi

if ! command_exists fnm; then
    cargo install fnm
fi

if ! command_exists exa; then
    cargo install exa
fi

if ! command_exists fzf; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --completion --key-bindings --no-update-rc
fi

if [[ "$machine" = "Linux" ]]; then
    if ! command_exists timer; then
        echo 'deb [trusted=yes] https://repo.caarlos0.dev/apt/ /' | sudo tee /etc/apt/sources.list.d/caarlos0.list
        apt update
        apt install timer
    fi
fi


if [[ "$machine" = "Mac" ]]; then
    if ! command_exists timer; then
        brew install caarlos0/tap/timer terminal-notifier 
    fi

    brew install gsed
fi

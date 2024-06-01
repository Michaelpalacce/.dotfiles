FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    ca-certificates \
    git \
    sudo

RUN apt-get install -y \
    stow \
    xz-utils

ENV USER=root
# Set the working directory to /root instead of `/`
WORKDIR /root

RUN curl -o- https://raw.githubusercontent.com/Michaelpalacce/.dotfiles/master/setup.sh | bash

# Dunno why this is needed `.zshrc` is not getting removed
RUN rm -rf $HOME/.zshrc

# We need to run the script in a new shell to make sure the environment is set up correctly 
RUN zsh -i -c 'curl -o- https://raw.githubusercontent.com/Michaelpalacce/.dotfiles/master/setup.sh | bash'

ENTRYPOINT ["/bin/zsh"]

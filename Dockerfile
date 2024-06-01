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
    xz-utils \ 
    tar

ENV USER=root

RUN curl -o- https://raw.githubusercontent.com/Michaelpalacce/.dotfiles/master/setup.sh | bash
# We need to run the script in a new shell to make sure the environment is set up correctly 
RUN zsh -i -c 'curl -o- https://raw.githubusercontent.com/Michaelpalacce/.dotfiles/master/setup.sh | bash'

ENTRYPOINT ["/bin/bash"]

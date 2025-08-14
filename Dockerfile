FROM archlinux:base AS user-setup

RUN sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf

# User
RUN pacman -Syu --noconfirm && \
    pacman -S sudo --noconfirm && \
    useradd -m -s /bin/bash stef && \
    echo "stef ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/stef-nopassword && \
    chmod 0440 /etc/sudoers.d/stef-nopassword

# Switch to the new user 'stef'
USER stef

COPY --chown=stef:stef . /home/stef/.dotfiles

WORKDIR /home/stef/.dotfiles

RUN ./setup-arch.sh --minimal && \
    ./setup.sh

# Set the working directory to the dotfiles folder.
WORKDIR /home/stef/

# The final image is now ready to use.
CMD ["/bin/tmux"]

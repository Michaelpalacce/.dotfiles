FROM archlinux:base AS user-setup

RUN sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf

# User
RUN pacman -Syu --noconfirm && \
    pacman -S sudo --noconfirm && \
    useradd -m -s /bin/bash stef && \
    echo "stef ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/stef-nopassword && \
    chmod 0440 /etc/sudoers.d/stef-nopassword

USER stef

COPY --chown=stef:stef . /home/stef/.dotfiles

WORKDIR /home/stef/.dotfiles

# Separate for caching. No space can be saved for now
RUN ./setup-arch.sh --minimal
RUN ./setup.sh

WORKDIR /home/stef/

RUN sudo chsh -s /bin/zsh stef

WORKDIR /home/stef/projects/

RUN git clone https://github.com/michaelpalacce/go-ddns-controller.git && \
git clone https://github.com/michaelpalacce/HomeLab.git && \
git clone https://github.com/michaelpalacce/HomeLab-IaC.git && \
git clone https://github.com/michaelpalacce/go-interpreter.git

WORKDIR /home/stef/

# The final image is now ready to use.
CMD ["/bin/tmux"]

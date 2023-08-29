# `Tis It Folks

Yes, this do be empty

## Getting Started

Run the home recipes to get everything setup

```bash
ansible-playbook Home/ansible/playbooks/main/main.yml -b -K
```

## Setup

Run the setup script as sudo 

```bash
sudo ./setup.sh
```

### What is `stow`?

`stow` is a symlink manager that allows us to create symlinks based on folders.

Example:
```ascii
.dotfiles/
├─ nvim/
│  ├─ .config/
│  │  ├─ nvim/

```
On the given folder structure, if you run `stow nvim` from `.dotfiles`, a Symlink will be created to `~/.config/nvim` ( aka from the home dir, whatever the structure was inside the `nvim` folder )


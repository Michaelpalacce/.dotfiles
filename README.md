# `Tis It Folks

Yes, this do be empty

## Setup

Run the setup script. It will prompt for sudo password 

```bash
curl -o- https://raw.githubusercontent.com/Michaelpalacce/.dotfiles/master/setup.sh | bash
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

## Explanations

### Moving Lines Up And Down

- This can be done by holding alt and `up/down/j/k`
- This works in `v`, `n`, `i` mode


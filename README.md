# `Tis It Folks

Yes, this do be empty

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

## Explanations

### QuickFix Navigation

- Utilizing `cnext` and `cprev`
- If you press `<S-Down> / <S-Up> / <S-j> / <S-k>` we can move up and down the quickfix list no matter if it's open or not. 

### Moving Lines Up And Down

- This can be done by holding alt and `up/down/j/k`
- This works in `v`, `n`, `i` mode


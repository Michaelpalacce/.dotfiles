# `Tis It Folks

![GitHub Repo stars](https://img.shields.io/github/stars/Michaelpalacce/.dotfiles?style=for-the-badge&color=cba6f7) ![GitHub last commit](https://img.shields.io/github/last-commit/Michaelpalacce/.dotfiles?style=for-the-badge&color=b4befe) ![GitHub repo size](https://img.shields.io/github/repo-size/Michaelpalacce/.dotfiles?style=for-the-badge&color=cba6f7)

> [!CAUTION]
>
> These are my personal dotfiles. They are heavily opinionated and they are not meant to be used by anyone else,
but I am open to suggestions and improvements. I am not using any fancy dotfile manager, instead I am using a bunch of bash scripts and `stow` to create symlinks to the appropriate locations.

# Showcase

<p align="center">
<img src="images/Desktop.png" alt="Desktop">
</p>

## ✨ UX Showcase

<p align="center">
<img src="images/Lockscreen.png" alt="Lockscreen">
</p>

<details>
    <summary>Super Menu</summary>
    <img src="images/SuperMenu.png"/>
</details>

<details>
    <summary>Emoji Picker</summary>
    <img src="images/EmojiPicker.png"/>
</details>

<details>
    <summary>Keybinds Menu</summary>
    <img src="images/KeybindsMenu.png"/>
</details>

<details>
    <summary>Learn Menu</summary>
    <img src="images/LearnMenu.png"/>
</details>

<details>
    <summary>News Menu</summary>
    <img src="images/NewsMenu.png"/>
</details>

<details>
    <summary>Packages Menu</summary>
    <img src="images/PackagesMenu.png"/>
</details>

<details>
    <summary>Power Menu</summary>
    <img src="images/PowerMenu.png"/>
</details>

<details>
    <summary>Run Menu</summary>
    <img src="images/RunMenu.png"/>
</details>

## ✨ Development Showcase

<p align="center">
<img src="images/Layout.png" alt="Layout">
</p>

<details>
    <summary>Pomodoro Timer</summary>
    <img src="images/Pomodoro.png"/>
</details>

<details>
    <summary>Debugging</summary>
    <img src="images/Debugging.png"/>
</details>

<details>
    <summary>Scripts</summary>
    <img src="images/Scripts.png"/>
</details>

<details>
    <summary>Cheatsheets</summary>
    <img src="images/cheatsheets.png"/>
</details>

<details>
    <summary>tmux-sessionizer</summary>
    <img src="images/Sessionizer.png"/>
</details>

## Dependencies

The following dependencies are needed to run the setup script:

- `curl` - for downloading the setup script
- `git` - for cloning the repository
- `brew` - for **MacOs** only. 

### Installing brew

For MacOS, we need homebrew installed... this is outside of the install script, so run this manually

> bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## 📦 Setup

The setup script will setup and configure the local development environment.
Run the setup script. It will prompt for sudo password if one is needed.

```bash
curl -o- https://raw.githubusercontent.com/Michaelpalacce/.dotfiles/master/setup.sh | bash
```

### Setup Identity

After running the setup script, you will need to run the following command to setup your ssh identity.
As this may contain sensitive information, it is not included in the main setup script.
Note: you need to have the correct `age` private key in `~/.config/sops/age/keys.txt` for this to work. This is stored in a private place

```bash
curl -o- https://raw.githubusercontent.com/Michaelpalacce/.dotfiles/master/setup-identity.sh | bash
```

### Setup Fingerprints

> [!WARNING]
> ONLY DO THIS IF YOU HAVE A FINGERPRINT READER AND YOU'VE ENROLLED YOUR FINGERPRINT.

Read: https://wiki.archlinux.org/title/Fprint
Run `fprintd-enroll` to enroll your fingerprint.

Setup pam, as described in the wiki.

```sh
sudo stow --target=/etc/pam.d pam
```

## Supported OS

I use these dotfiles on the following Operating Systems. Everything is setup to work together.

- [x] Arch
- [x] MacOS

Note: Will support whatever I work on.

There are of course differences in the two systems. MacOS will never look, feel and work like Arch/Linux and that's OK.

## Philosophy

- Prioritize native keybindings and minimal plugin reliance. NeoVim being the plugin exception... I can't pass on the hot new thing
- Lazy load all resources.
- Ensure clear resource separation.
- Document extensively for future reference.
- Always prioritize speed.

## Details

### Structure

#### Mac Specific

- `aerospace` - Tiling Manager for MacOS
- `karabiner` - Keyboard remapping for macos

#### Linux Specific

- `hyprland` - Contains hyprland configuration for Arch Linux
- `hyprworm` - Nice window switcher
- `sddm` && `sddm-themes` - Greeter
- `rofi` - Also an app launcer
- `waybar` - Status Bar for Hyprland
- `waycorner` - Hot corners (like MacOS)
- `waypaper` - Wallpapers for Hyprland
- `xsettingsd` - For themes
- `eww` - Widgets baby

#### Universal

- `alacritty` - Contains my alacritty configurations
- `bin` - Check out the [#Scripts](#scripts) section for this,
- `cheatsheets` - this contains some local cheatsheets that I can access at any time with `sc`
- `editorconfig` - this contains my default editorconfig that gets used everywhere
- `git-hooks` - Contains some git-hooks for identity
- `gitignore` - Default gitignore for common directories/files you want to ignore
- `images` - Images for the dotfiles
- `nvim` - Personalized Development Environment in NeoVim
- `setup` - Setup scripts ran by `setup.sh`
- `sh` - `zsh` configuration
- `ssh` - Encrypted identity
- `tmux` - `tmux` configuration

### Neovim

Neovim is heavily modified to match my needs. Those needs are admittedly constantly changing, so my configuration will end up 
changing with it.

I try to keep the native capabilities of vim and use them as much as possible, however a lot of quality of life changes are done.

### Aliases

I am not a big fan of using aliases, cause honestly I tend to forget what I set. My methodology includes using aliases for as little as possible.

The main aliases that get added would also be remaps in Neovim (this can be observed in the `remaps.lua` and `.zsh_aliases`).

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

### Scripts

#### tmux-cht

A helper utility that will either query cheat.sh or open up local cheatsheets, defined in `$HOME/.config/cheatsheets/`
Provides functionality to delete and create cheatsheets.

#### tmux-identity-theft

A helper utility for switching different identities, for example: `.npmrc`, `~/.m2/settings.xml`, etc. It utilizes symlinks and expects you to have put the
alternative identities with the originals. Example:

```
.npmrc
.npmrc.vmware
.npmrc.public
```

#### tmux-sshuttle-daddy

`tmux-sshuttle-daddy` is a utility tool designed to assist with VPN connections using sshuttle.
It requires sshuttle to be installed. 
The utility reads your ~/.ssh/known_hosts file and prompts you to either select from the existing IPs or specify a new one."

#### tmux-timer

Starts a new timer in a separate tmux window. Will prompt you for 2 arguments if they are not given.

#### tmux-wttr

Shows the weather forecast in another tmux windows.

#### tmux-chooser

Forces `tmux` if a normal terminal is opened. It will also ask which tmux session to attach to if there are multiple.

## Inspirations

- [Omarchy](https://github.com/basecamp/omarchy) For UX
- [Prime](https://github.com/ThePrimeagen/.dotfiles) For dev
- [bashbunni](https://github.com/bashbunni/dotfiles) For a nice timer :)

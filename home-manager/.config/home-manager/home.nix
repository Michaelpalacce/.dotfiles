{ config, pkgs, ... }:

# @TODO: Migrate to using home-manager, currently stuff is installed during setup
let
  unstableTarball =
    fetchTarball
      "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  homeDir = builtins.getEnv "HOME";
  username = builtins.getEnv "USER";
  isLinux = pkgs.stdenv.isLinux;
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  home.username = username;
  home.homeDirectory = homeDir;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # General
    pkgs.curl
    pkgs.htop
    pkgs.sshpass
    pkgs.unzip
    pkgs.dos2unix
    pkgs.gnupg
    pkgs.sshpass
    pkgs.wget

    # Development
    pkgs.git
    pkgs.awscli
    pkgs.xclip
    pkgs.zsh
    pkgs.tmux
    pkgs.alacritty
    pkgs.eza
    pkgs.stow
    pkgs.gh
    pkgs.docker
    pkgs.unstable.fzf

    # Kubernetes
    pkgs.k9s
    pkgs.kubent
    pkgs.kubectl
    pkgs.velero
    pkgs.unstable.fluxcd
    pkgs.kubernetes-helm

    # Neovim
    pkgs.unstable.neovim
    pkgs.ripgrep
    pkgs.fd

    # Go
    pkgs.unstable.go

    # Java
    pkgs.zulu17
    pkgs.maven

    # Node
    pkgs.fnm

    # Python
    pkgs.python3
    pkgs.python312Packages.pip

    # Rust
    pkgs.rustup

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ] 
  ++ (if isLinux then [
    # Kubernetes
    pkgs.kubescape

    # General
    pkgs.vlc
    pkgs.nfs-utils
    pkgs.lsb-release

    # Gaming
    pkgs.python311Packages.openrazer
    pkgs.wine64Packages.unstableFull

    # KVM
    pkgs.qemu
    pkgs.libvirt
    pkgs.virt-manager
    pkgs.bridge-utils
  ] else [])
  ++ (if isDarwin then [
      pkgs.terminal-notifier
  ] else []);

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".gitignore".source = git/.gitignore;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/stefan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = 
  (if isLinux then {
    # Linux specific environment variables
  } else if isDarwin then {
    # Darwin specific environment variables
  } else {}) // {
    # Common environment variables
    EDITOR = "nvim";
    JAVA_HOME = "${pkgs.zulu17}";
  };

  home.sessionPath = [
    "$HOME/.nix-profile/bin" #binaries
    "$HOME/.nix-profile/share/applications" #.desktop files
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Git
  programs.git = {
    enable = true;
    userName = "Stefan Genov";
    userEmail = "sgenov94@gmail.com";
  
    extraConfig = {
      core = {
        editor = "nvim";
        excludesFile = "${homeDir}/.gitignore";
      };
      push = { autoSetupRemote = true; };
      credential = { helper = "store"; };
    };
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      df = "diff";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
  };
}

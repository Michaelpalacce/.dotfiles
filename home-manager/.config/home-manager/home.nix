{ config, pkgs, ... }:

# Philosophy:
# - Nix and Home Manager are used mainly to install and manage development tools and packages
# - Home Manager will not be used to manage any GUI applications or settings, since it doesn't work well outside of NixOS
# - When it comes to `.zshrc` and other sourced files, these are also not the responsibility of Home Manager
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

  home.enableNixpkgsReleaseCheck = false;

  # Enable flake support
    nix = {
        package = pkgs.nix;
        settings.experimental-features = [ "nix-command" "flakes" ];
    };

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
    pkgs.htop               pkgs.sshpass        pkgs.unzip      pkgs.dos2unix       pkgs.gnupg
    pkgs.sshpass            pkgs.sshuttle       pkgs.gnumake    pkgs.libuv          pkgs.smartmontools
    pkgs.timer

    # Development
    pkgs.awscli             pkgs.xclip          pkgs.gh         pkgs.gcc

    # Encryption And Security
    pkgs.sops               pkgs.age            pkgs.crowdsec

    # Kubernetes
    pkgs.k9s                pkgs.kubent         pkgs.kubectl    pkgs.velero         pkgs.unstable.fluxcd
    pkgs.kubernetes-helm    pkgs.kind           pkgs.talosctl   pkgs.kubebuilder

    # Go
    pkgs.unstable.go

    # Python
    pkgs.python3

    # Rust
    pkgs.rustup

    pkgs.unstable.nerd-fonts.jetbrains-mono
    pkgs.unstable.nerd-fonts.symbols-only

    # IaC
    pkgs.terraform


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
    pkgs.nfs-utils                      pkgs.lsb-release

    # Gaming
    pkgs.python311Packages.openrazer    pkgs.wine64Packages.unstableFull

    # Java
    pkgs.zulu17             pkgs.maven

    # IaC
    pkgs.ansible
  ] else [])
  ++ (if isDarwin then [
      pkgs.terminal-notifier
      pkgs.gnused
  ] else []);

  # Session variables hold variables needed specifically since things were installed via nix
  home.sessionVariables = 
  (if isLinux then {
    # Linux specific environment variables
    JAVA_HOME = "${pkgs.zulu17}";
  } else if isDarwin then {
    # Darwin specific environment variables
  } else {}) // {
    # Common environment variables
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "$HOME/.nix-profile/bin" #binaries
    "$HOME/.nix-profile/share/applications" #.desktop files
  ];

  # Fonts
  fonts.fontconfig.enable = true;
  # Programs

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

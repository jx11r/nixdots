{ config, pkgs, ... }:

let
  unstableTarball = fetchTarball
    https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
in
{
  nixpkgs.config = {
    allowUnfree = true;

    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    # Hardware
    pulseaudio-ctl
    brightnessctl
    ntp

    # Window Manager
    unstable.qtile

    # Terminal
    # xterm
    alacritty
    
    # Shell Utilities
    # gitstatus
    # zsh-autosuggestions
    # zsh-syntax-highlighting

    # Utilities
    unzip
    wget
    git
    sxiv
    rofi
    papirus-icon-theme
    neofetch
    htop
    exa
    bat

    # Code Editor
    # vscodium
    # emacs
    unstable.neovim
    nano
    vim

    # File Manager
    xfce.thunar
    xfce.thunar-volman
    ranger

    # Browser
    # w3m
    # ungoogled-chromium
    firefox

    # Social Media
    # whatsapp-for-linux
    unstable.tdesktop

    # Desktop
    # gpicview
    # gimp
    # spotify
    lxappearance
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "Mononoki"
        "SourceCodePro"
      ];
    })

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}

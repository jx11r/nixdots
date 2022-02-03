{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Hardware
    pulseaudio
    pulseaudio-ctl
    brightnessctl
    openssh
    ntp

    # Terminal & Shell
    alacritty
    gitstatus
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh

    # Utilities
    unzip
    gcc
    wget
    curl
    git
    sxiv
    rofi
    papirus-icon-theme
    neofetch
    htop
    exa
    bat

    # Code Editor
    vscodium
    emacs
    neovim
    vim

    # File Manager
    xfce.thunar
    xfce.thunar-volman
    ranger

    # Browser
    # firefox
    # w3m
    ungoogled-chromium

    # Social Media
    # whatsapp-for-linux
    tdesktop

    # Desktop
    # gpicview
    # gimp
    # spotify
    lxappearance
    gnome.gnome-screenshot
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

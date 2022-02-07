{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Hardware
    pulseaudio-ctl
    brightnessctl
    ntp

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
    neovim
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
    tdesktop

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

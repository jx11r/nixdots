{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Hardware
    ntp

    # Terminal
    alacritty

    # Utilities
    unzip
    gcc
    wget
    curl
    git
    exa
    bat

    # Code Editor
    nano
    vim

    # File Manager
    ranger

    # Browser
    # w3m
    # ungoogled-chromium
    firefox
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

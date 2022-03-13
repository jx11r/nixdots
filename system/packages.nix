{ pkgs, ... }:

{
  imports = [ ../overlays ];

  environment.systemPackages = with pkgs; [
    brightnessctl
    pulseaudio-ctl
    wget
    ntp
    git
    xclip
    unzip
    nano
    vim
  ] ++ (import ./bin pkgs);

  fonts.fonts = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "FiraCode"
        "JetBrainsMono"
        "Mononoki"
        "SourceCodePro"
      ];
    })

    powerline-fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}

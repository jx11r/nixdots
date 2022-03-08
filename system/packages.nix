{ pkgs, ... }:

{
  imports = [ ../overlays ];

  environment.systemPackages = with pkgs; [
    # -=[ Hardware ]=-
    # [x] pulseaudio
    # [x] openssh
    pulseaudio-ctl
    brightnessctl

    # -=[ System ]=-
    # [x] time
    home-manager
    playerctl
    htop
    # gtop
    # gotop
    wget
    ntp
    git

    # -=[ Window Manager ]=-
    # [x] unstable.qtile
    # [ ] bspwm
    # [ ] sxhkd

    # -=[ Display Manager ]=-
    # [ ] lightdm
    # [x] sddm
    # [ ] ly
    # [ ] startx

    # -=[ Terminal ]=-
    # xterm
    alacritty
    unstable.wezterm

    # -=[ Shell ]=-
    # [x] bash
    # [ ] dash
    # [x] zsh

    # -=[ Shell Utilities ]=-
    # [ ] gitstatus
    # [x] zsh-autosuggestions
    # [x] zsh-syntax-highlighting
    starship

    # -=[ Utilities ]=-
    # [x] picom
    # scrot (deprecated)
    # peaclock
    # feh
    sxiv
    # dmenu
    rofi
    neofetch
    # cava
    maim
    xclip
    unzip
    exa
    bat

    # -=[ Code Editor ]=-
    # vscodium
    # emacs
    unstable.neovim
    nano
    vim

    # -=[ File Manager ]=-
    xfce.thunar
    xfce.thunar-volman
    ranger

    # -=[ Browser ]=-
    # ungoogled-chromium
    # qutebrowser
    # opera
    # w3m
    firefox

    # -=[ Social Media ]=-
    # whatsapp-for-linux
    unstable.tdesktop

    # -=[ Desktop ]=-
    papirus-icon-theme
    # gnome.gnome-screenshot
    # gpicview
    # vlc
    # evince
    # libreoffice
    # gimp
    # spotify
    # spotify-tui
    lxappearance
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

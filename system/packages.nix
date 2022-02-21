{ pkgs, ... }:

{
  imports = [ ../overlays ];

  environment.systemPackages = with pkgs; [
    # -=[ Hardware ]=-
    pulseaudio-ctl
    # [x] pulseaudio
    # [x] openssh
    brightnessctl

    # -=[ System ]=-
    home-manager
    # [x] time
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
    # [ ] bash
    # [x] dash
    # [x] zsh

    # -=[ Shell Utilities ]=-
    # [ ] gitstatus
    # [x] zsh-autosuggestions
    # [x] zsh-syntax-highlighting

    # -=[ Utilities ]=-
    # scrot (deprecated)
    # [ ] picom
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

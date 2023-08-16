{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      alsa-tools
      alsa-utils
      bat
      brightnessctl
      btop
      cmake
      curl
      exa
      fd
      ffmpeg
      ffmpegthumbnailer
      fzf
      gcc
      gh
      gparted
      home-manager
      icu
      keepassxc
      libgsf
      libnotify
      libsecret
      man-pages
      man-pages-posix
      neofetch
      neovim
      nerdfix
      nix-prefetch-git
      nodejs
      ntfs3g
      numlockx
      pamixer
      pavucontrol
      playerctl
      psmisc
      ranger
      ripgrep
      unrar
      unzip
      wget
      wgetpaste
      xclip
      xorg.xinit
      xorg.xkill
      xorg.xprop
      xorg.xrandr
      xorg.xset
      zip
    ] ++ (with python3Packages; [
      mypy
      pip
      virtualenv
    ]) ++ [
      # packages not listed in nixpkgs
      sddm-chili
      wired
    ];

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "CascadiaCode"
          "Mononoki"
          "SourceCodePro"
        ];
      })

      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];
  };
}

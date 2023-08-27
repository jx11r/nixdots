{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      alsa-tools
      alsa-utils
      bat
      btop
      curl
      exa
      fd
      ffmpeg
      ffmpegthumbnailer
      fzf
      home-manager
      icu
      libgsf
      libnotify
      libsecret
      man-pages
      neofetch
      neovim
      nix-prefetch-git
      nodejs
      ntfs3g
      numlockx
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

      # global python packages
      (python3.withPackages (ps: with ps; [
        mypy
        pip
        virtualenv
      ]))

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

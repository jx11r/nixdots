{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      alsa-tools
      alsa-utils
      bat
      curl
      exa
      fd
      ffmpeg
      ffmpegthumbnailer
      fzf
      gcc
      home-manager
      icu
      imagemagick
      libgsf
      libnotify
      libsecret
      man-pages
      neofetch
      neovim
      nix-prefetch-git
      ntfs3g
      numlockx
      nvd
      picom
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

      # packages not listed in nixpkgs
      sddm-chili
      wired
    ] ++ (import ./bin pkgs);

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "CascadiaCode"
          "Hasklig"
          "NerdFontsSymbolsOnly"
        ];
      })

      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];
  };
}

{ pkgs, ... }:

{
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  users = {
    mutableUsers = true;
    defaultUserShell = pkgs.zsh;

    users.jx11r = {
      home = "/home/jx11r";
      description = "Jair Sánchez";
      extraGroups = [ "wheel" ];
      isNormalUser = true;
      password = "nix";

      packages = with pkgs; [
        # [ Terminal ]
        alacritty
        unstable.wezterm
        
        # [ Code Editor ]
        # vscodium
        # emacs
        unstable.neovim
        
        # [ Programs ]
        playerctl
        starship
        exa
        bat
        htop
        # gtop
        # gotop
        # scrot (deprecated)
        # peaclock
        # feh
        sxiv
        # dmenu
        rofi
        neofetch
        # cava
        maim
        
        # [ File Manager ]
        xfce.thunar
        xfce.thunar-volman
        ranger
        
        $ [ Browser ]
        # ungoogled-chromium
        # qutebrowser
        # opera
        # w3m
        firefox
        
        # [ Chat ]
        # whatsapp-for-linux
        unstable.tdesktop
        
        # [ Desktop ]
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
    };
  };
}

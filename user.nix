{ config, pkgs, ... }:

{
  users = {
    mutableUsers = true;
    defaultUserShell = pkgs.zsh;

    users.jx11r = {
      isNormalUser = true;
      description = "Jair Sánchez";
      home = "/home/jx11r";
      extraGroups = [ "Wheel" ];

      packages = with pkgs; [
        # Hardware
        pulseaudio-ctl
        brightnessctl

        # Shell Utilities
        gitstatus
        zsh-autosuggestions
        zsh-syntax-highlighting

        # Utilities
        sxiv
        rofi
        papirus-icon-theme
        neofetch
        htop

        # Code Editor
        vscodium
        emacs
        neovim

        # File Manager
        xfce.thunar
        xfce.thunar-volman

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
    };
  };
}

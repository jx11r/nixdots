{ inputs, outputs, config, lib, pkgs, ... }:

let
  icon = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/jx11r/src/i/icon/jx11r.jpg";
    sha256 = "1l5w06sbl6m2bc4ysnbqi3xz5fnifiik6sba7g6m60kgh83drlw7";
  };
in

{
  nixpkgs.overlays = import ../overlays { inherit inputs; };

  home = {
    homeDirectory = "/home/jx11r";
    username = "jx11r";

    file = {
      ".config/neofetch/config.conf".text = import ./config/neofetch.nix pkgs;
      ".config/picom/picom.conf".source = ./config/picom.conf;
      ".config/rofi".source = ./config/rofi;
      ".config/wezterm".source = ./config/wezterm;
      ".config/wired/wired.ron".source = ./config/wired.ron;
      ".gnupg/gpg-agent.conf".text = import ./config/gpg-agent.nix { };
      ".face.icon".source = icon;
      ".xprofile".text = import ./config/xprofile.nix { };
      ".zprofile".text = import ./config/zprofile.nix { };
    };
  };

  programs = {
    bat = import ./config/bat.nix pkgs;
    zsh = import ./config/zsh.nix pkgs;
    home-manager.enable = true;

    bash = {
      enable = true;
      enableCompletion = false;
      historyFileSize = 100000;
      historyControl = [
        "erasedups"
        "ignoredups"
        "ignorespace"
      ];
    };

    starship = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = false;
      settings = import ./config/starship.nix { };
    };
  };

  gtk = {
    enable = true;

    cursorTheme = {
      name = "Simp1e";
      package = pkgs.simp1e-cursors;
    };

    font = {
      name = "Sans Regular";
      size = 10;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "lavender";
        flavor = "mocha";
      };
    };

    theme = {
      name = "Catppuccin-Mocha-Standard-Maroon-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "maroon" ];
        size = "standard";
        tweaks = [ ];
        variant = "mocha";
      };
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";

    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };

  # systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.05";
}

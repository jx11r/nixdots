{ inputs, outputs, lib, config, pkgs, ... }:

{
  home = {
    homeDirectory = "/home/jx11r";
    username = "jx11r";
    packages = import ./packages.nix { inherit pkgs; };

    file = {
      ".config/picom/picom.conf".source = ./config/picom.conf;
      ".config/rofi".source = ./config/rofi;
      ".config/wezterm".source = ./config/wezterm;
      ".config/wired/wired.ron".source = ./config/wired.ron;
      ".gnupg/gpg-agent.conf".text = import ./config/gpg-agent.nix { };
      ".face.icon".source = ./files/icon.jpeg;
      ".xprofile".text = import ./config/xprofile.nix { };
      ".zprofile".text = import ./config/zprofile.nix { };
    };
  };

  programs = {
    bat = import ./config/bat.nix { inherit pkgs; };
    zsh = import ./config/zsh.nix { };

    starship = {
      enable = true;
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

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.05";
}

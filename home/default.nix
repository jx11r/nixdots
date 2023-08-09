{ inputs, config, lib, pkgs, ... }:

{
  gtk.enable = true;
  qt.enable = true;

  home = {
    homeDirectory = "/home/jx11r";
    username = "jx11r";
    packages = (import ./packages.nix { inherit pkgs; });

    file = {
      ".xprofile".text = (import ./config/xprofile.nix { });
      ".zprofile".text = (import ./config/zprofile.nix { });
      ".config/picom/picom.conf".source = ./config/picom.conf;
      ".config/rofi".source = ./config/rofi;
      ".config/wezterm".source = ./config/wezterm;
      ".config/wired/wired.ron".source = ./config/wired.ron;
    };
  };

  programs = {
    bat = (import ./config/bat.nix { inherit pkgs; });
    zsh = (import ./config/zsh.nix { });

    starship = {
      enable = true;
      settings = (import ./config/starship.nix { });
    };
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.05";
}

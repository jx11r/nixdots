{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in

{
  imports = [
    (import "${home-manager}/nixos")
    ./user.nix
  ];

  programs.zsh = import ./config/zsh { };

  home-manager.users.jx11r = {
    home.file = {
      ".zshrc".text = import ./config/zsh/extras.nix { };
      ".config/pulseaudio-ctl/config".text = import ./config/pulse.nix { };
      ".config/rofi".source = ./config/rofi;
    };

    programs = {
      alacritty = {
        enable = true;
        settings = import ./config/alacritty { };
      };

      starship = {
        enable = true;
        settings = import ./config/starship.nix { };
      };

      bat = {
        enable = true;
        config = import ./config/bat.nix { };
      };
    };
  };
}

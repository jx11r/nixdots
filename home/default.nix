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

  home-manager.users.jx11r = {

    programs = {
      alacritty = {
        enable = true;
        settings = import ./config/alacritty.nix { };
      };
    };
  };
}

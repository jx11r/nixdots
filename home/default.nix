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

  programs.zsh = import ./config/zsh.nix { };

  home-manager.users.jx11r = {
    home.file = {
      ".zshrc".text = import ./config/zsh_extras.nix { };
    };

    programs = {
      alacritty = {
        enable = true;
        settings = import ./config/alacritty { };
      };
    };
  };
}

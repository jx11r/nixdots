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
      # User Configurations
      ".xinitrc".text = import ./config/xinitrc.nix { };
      ".zprofile".text = import ./config/zprofile.nix { };
      ".zshrc".text = import ./config/zsh/extras.nix { };
      ".config/picom.conf".text = import ./config/picom.nix { };
      ".config/pulseaudio-ctl/config".text = import ./config/pulse.nix { };
      ".config/rofi".source = ./config/rofi;

      # User Scripts
      ".local/bin/ssh-start" = {
        executable = true;
        source = ./bin/ssh-start.sh;
      };

      ".local/bin/ssh-key" = {
        executable = true;
        source = ./bin/ssh-key.sh;
      };
    };

    programs = {
      alacritty = {
        enable = true;
        settings = import ./config/alacritty { };
      };

      bat = {
        enable = true;
        config = import ./config/bat.nix { };
      };

      git = {
        enable = true;
      } // (import ./config/git.nix);

      starship = {
        enable = true;
        settings = import ./config/starship.nix { };
      };
    };
  };
}

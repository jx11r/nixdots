{ config, pkgs, ... }:

{
  imports = [
    ./system/default.nix
    ./home/user.nix
  ];

  nix = {
    optimise.automatic = true;
    useSandbox = false;

    gc = {
      automatic = true;
      persistent = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
  };

  system.stateVersion = "21.11";
}

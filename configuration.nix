{ config, pkgs, ... }:

{
  imports = [
    ./system/default.nix
    ./home/user.nix
  ];

  system.stateVersion = "21.11";
}

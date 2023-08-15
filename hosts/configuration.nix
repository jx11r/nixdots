{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [ ../system/configuration.nix ];

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      sandbox = true;
    };

    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs = {
    config.allowUnfree = true;

    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      inputs.wired.overlays.default
    ];
  };

  system.stateVersion = "23.05";
}

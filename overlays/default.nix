{ config, pkgs, ...  }:

let
  unstable-overlays = [
    (import ./qtile.nix)
  ];

  overlays = [
    # ...
  ];
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;

      packageOverrides = pkgs: {
        unstable = import <nixos-unstable> {
          config = config.nixpkgs.config;
          overlays = unstable-overlays;
        };
      };
    };

    overlays = overlays;
  };
}

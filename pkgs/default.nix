{ pkgs ? import <nixpkgs> { } }: {
  sddm-chili = pkgs.callPackage ./sddm-chili.nix { };
}

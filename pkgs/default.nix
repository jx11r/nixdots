{ pkgs ? (import ../nixpkgs.nix) { } }: {
  sddm-chili = pkgs.callPackage ./sddm-chili.nix { };
}

# custom packages, that can be defined similarly to ones from nixpkgs
# you can build them using `nix build .#example`

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  # example = pkgs.callPackage ./example { };
}

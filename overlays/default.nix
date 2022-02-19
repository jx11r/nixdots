let
  overlays = [
    (import ./qtile.nix)
  ];
in
{
  nixpkgs = {
    overlays = overlays;
  };
}

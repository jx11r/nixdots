# shell for bootstrapping flake-enabled nix and home-manager
# you can enter it through `nix develop`

{ pkgs ? (import ./nixpkgs.nix) { } }: {
  default = pkgs.mkShell {
    # enable experimental features without having to specify the argument
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [ nix home-manager git ];
  };
}

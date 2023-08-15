{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    wired.url = "github:Toqozz/wired-notify";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # acessible through `nix build`, `nix shell`, etc
      packages.${system} = import ./pkgs { inherit pkgs; };

      # acessible through `nix develop` or `nix-shell`
      devShells.${system} = import ./shell.nix { inherit pkgs; };

      # custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };

      # reusable nixos modules
      nixosModules = import ./modules;

      # available through `nixos-rebuild --flake .#<host>`
      nixosConfigurations = {
        "desktop" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          inherit system;
          modules = [ ./hosts/desktop ];
        };
      };

      # available through `home-manager --flake .#<user>`
      homeConfigurations = {
        "jx11r" = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs outputs; };
          inherit pkgs;
          modules = [ ./home ];
        };
      };
    };
}

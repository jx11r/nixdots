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

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";

      extras = {
        # custom packages
        wired = inputs.wired.packages.${system}.wired;
      };

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit extras inputs system; };
          modules = [ ./hosts/desktop ];
        };
      };

      homeConfigurations = {
        jx11r = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs; };
          pkgs = pkgs;
          modules = [ ./home ];
        };
      };
    };
}

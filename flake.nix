{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    wired.url = "github:Toqozz/wired-notify";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    grub2-themes.url = "github:vinceliuice/grub2-themes";
    grub2-themes.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      inherit lib;
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      overlays = import ./overlays { inherit inputs; };
      packages.${system} = import ./pkgs { inherit pkgs; };

      nixosConfigurations = {
        asus = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          inherit system;
          modules = [ ./system ./hosts/asus ];
        };
      };

      homeConfigurations = {
        jx11r = lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs outputs; };
          inherit pkgs;
          modules = [ ./home ];
        };
      };
    };
}

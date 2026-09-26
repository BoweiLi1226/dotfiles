{
  description = "Bowei's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nix-darwin, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mac
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [
        ./common
        ./darwin
      ];

      specialArgs = {
        inherit inputs;
      };
    };

    homeConfigurations.boweili = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home
      ];

      extraSpecialArgs = {
        inherit inputs;
      };
    };
  };
}

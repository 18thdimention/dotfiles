{
	description = "Doyeon's dotfiles with nix darwin";

	inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin.url = "github:LnL7/nix-darwin";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

	outputs = { nixpkgs, home-manager, darwin, nix-homebrew, ... }:
    let
      system = "aarch64-darwin"; 
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Home Manager configuration
      homeConfigurations = {
        "doyeon" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./modules/home.nix
          ];
        };
      };

      # nix-darwin and nix-homebrew configuration
      darwinConfigurations = {
        "doyeon" = darwin.lib.darwinSystem {
          inherit system;
          modules = [
            nix-homebrew.darwinModules.nix-homebrew
            ./modules/darwin.nix
            ./modules/homebrew.nix
          ];
        };
      };
    };
}

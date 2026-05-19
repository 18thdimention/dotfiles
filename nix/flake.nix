{
  description = "Catacomb Flake";

  inputs = {
		# DEFAULTS
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

		# HOME MANAGER
		home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		# HOMEBREW
		nix-homebrew.url = "github:zhaofengli/nix-homebrew";
		homebrew-cask = {
			url = "github:homebrew/homebrew-cask";
			flake = false;
		};
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, homebrew-cask }: 
let
      system = "aarch64-darwin"; 
      pkgs = nixpkgs.legacyPackages.${system};
    in{
    # $ darwin-rebuild build --flake .#doyeon
		homeConfigurations = {
			"doyeon" = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
					./modules/home.nix
				];
			};
		};

		darwinConfigurations = {
			"doyeon" = nix-darwin.lib.darwinSystem {
				inherit system;
				modules = [ 
					nix-homebrew.darwinModules.nix-homebrew
					./modules/darwin.nix
					./modules/brew.nix
				];
			};
		};
	};
}

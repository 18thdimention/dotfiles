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

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.vim
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # $ darwin-rebuild build --flake .#doyeon
		homeConfigurations = {
			"doyeon" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.${system};
				modules = [
					./modules/home.nix
				];
			};
		};

		darwinConfigurations = {
			"doyeon" = nix-darwin.lib.darwinSystem {
				system = "aarch64-darwin";
				modules = [ 
					nix-homebrew.darwinModules.nix-homebrew
					./modules/darwin.nix
					./modules/brew.nix
					configuration
					home-manager.darwinModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.doyeon = import ./modules/home.nix;
					}
				];
			};
		};
	};
}

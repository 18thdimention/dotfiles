{ config, pkgs, ... }:

{
# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget

	users.users.doyeon = {
		home = "/Users/doyeon";
	};

	environment.systemPackages = with pkgs; [
		cmake
		ninja
		sqlite
		rustup
		lua51Packages.luarocks
		go
		wget
		fd
		fastfetch
		docker
		home-manager
		git
		gcc
		neovim
		lazygit
		lua5_1
		lua
		nodejs
		rustc
		cargo

		btop
		starship

		bat
		eza
		tree
		ripgrep
		fzf
		zsh-fzf-tab
		zsh-syntax-highlighting
		zoxide

		tmux

		curl
		mas
		ollama
	];

# Necessary for using flakes on this system.
	nix = {
		package = pkgs.nix;
		settings = {
			"extra-experimental-features" = [ "nix-command" "flakes" ];
		};
	};


# Create /etc/zshrc that loads the nix-darwin environment.
	programs.zsh.enable = true;  # default shell on catalina

# Set Git commit hash for darwin-version.
	system.configurationRevision = config.rev or config.dirtyRev or null;

# $ darwin-rebuild changelog
	system.stateVersion = 6;

	system.primaryUser = "doyeon";

# The platform the configuration will be used on.
	nixpkgs.hostPlatform = "aarch64-darwin";

# System preferences and settings
	system.defaults = {
		dock = {
			autohide = true;
			orientation = "bottom";
			tilesize = 48;
			show-recents = false;
			minimize-to-application = false;
		};

		finder = {
			AppleShowAllExtensions = true;
			ShowPathbar = true;
			ShowStatusBar = false;
			FXPreferredViewStyle = "clmv"; # Column view
		};

		NSGlobalDomain = {
			AppleInterfaceStyle = "Dark";
			AppleShowAllExtensions = true;
			"_HIHideMenuBar" = false;
			ApplePressAndHoldEnabled = false;
			NSAutomaticSpellingCorrectionEnabled = false;
			"com.apple.keyboard.fnState" = true;
		};

		screencapture = {
			location = "~/Desktop";
			type = "png";
		};

		loginwindow.GuestEnabled = false;
	};

	system.keyboard = {
		enableKeyMapping = true;
		remapCapsLockToControl = true;
	};

	fonts.packages = with pkgs; [
		nerd-fonts.fira-code
	];
}

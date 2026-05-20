{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

	environment.systemPackages = with pkgs; [
		# home-manager

		git
		gcc
		neovim

		lua
		nodejs
		rustc
		cargo

		btop

		bat
		eza
		tree
		ripgrep
		fzf
		zsh-fzf-tab
		zoxide

		tmux

		curl
		mas
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
    # Dock settings
    dock = {
      autohide = true;
      orientation = "bottom";
      tilesize = 30;
      show-recents = false;
      minimize-to-application = false;
    };

	trackpad = {
		FirstClickThreshold = 0;
	};

    # Finder settings
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      ShowStatusBar = false;
      FXPreferredViewStyle = "clmv"; # Column view
    };

    # Global domain settings
    NSGlobalDomain = {
      # Interface
      AppleInterfaceStyle = "Dark";
      AppleShowAllExtensions = true;
      
      # Text and input settings
      ApplePressAndHoldEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
	"com.apple.keyboard.fnState" = true;
    };

    # Screenshots (simplified)
    screencapture = {
      location = "~/Desktop";
      type = "png";
    };

    # Login window
    loginwindow.GuestEnabled = false;
  };

system.keyboard = {
  enableKeyMapping = true;
  remapCapsLockToControl = true;
};


  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}

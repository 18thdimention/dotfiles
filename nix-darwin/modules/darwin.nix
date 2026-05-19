{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # System-level packages can go here
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Set Git commit hash for darwin-version.
  system.configurationRevision = config.rev or config.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # System preferences and settings
  system.defaults = {
    # Dock settings
    dock = {
      autohide = true;
      orientation = "bottom";
      tilesize = 64;
      show-recents = false;
      minimize-to-application = false;
    };

    # Finder settings
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      ShowStatusBar = false;
      FXPreferredViewStyle = "Nlsv"; # List view
    };

    # Global domain settings
    NSGlobalDomain = {
      # Keyboard settings
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      
      # Interface
      AppleInterfaceStyle = "Dark";
      AppleShowAllExtensions = true;
      "_HIHideMenuBar" = true;
      
      # Text and input settings
      ApplePressAndHoldEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };

    # Screenshots (simplified)
    screencapture = {
      location = "~/Desktop";
      type = "png";
    };

    # Login window
    loginwindow.GuestEnabled = false;
  };

  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];

}

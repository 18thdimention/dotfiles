{ ... }:
{
  homebrew = {
    enable = true;
    enableRosetta = true;
    user = "Ari";
    # autoMigrate = true;

    taps = [
    ];
    brews = [
			"bat"
      "docker"
      "docker-completion"
      "gcc"
      "luarocks"
      "ncurses"
      "node"
      "python@3.13"
			"python@3.14"
      "sdl2"
      "tree-sitter"
      "zsh-syntax-highlighting"
      "skhd"
    ];
		# brew list | awk '{print "      \"" $1 "\""}' | pbcopy
    casks = [
			"nikitabobko/tap/aerospace"
      "desktoppr"
      "raycast"
      "ghostty"
			"jellyfin"
			"obsidian"
			"firefox"
      # brew list --cask | awk '{print "      \"" $1 "\""}' | pbcopy
    ];
  };
}

{ config, pkgs, ... }:

{
  home.username = "doyeon";
  home.homeDirectory = "/Users/doyeon";
  home.stateVersion = "24.05";

  programs.git = {
    enable = true;

		signing = {
			key = "~/.ssh/id_ed25519.pub";
			signByDefault = true;
		};

		settings = {
			user.name = "18thdimention";
			user.email = "doyeonxxxx@gmail.com";

			init.defaultBranch = "main";
			gpg.format = "ssh";

			push.autoSetupRemote = true;
			pull.rebase = false;
		};

    ignores = [
      ".DS_Store"
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      switch = "sudo darwin-rebuild switch --flake ~/dotfiles/nix";
      ll = "ls -la";
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }

      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];

		autosuggestion.enable = true;
    initContent = ''
			bindkey '^[[13;2u' autosuggest-accept
      if [[ -f ~/.config/zsh/.zshrc ]]; then
        source ~/.config/zsh/.zshrc
      fi
    '';
  };

	programs.starship = {
		enable = true;
		enableZshIntegration = true;
	};

  home.file.".config/ghostty".source = ../config/ghostty;
  home.file.".config/aerospace".source = ../config/aerospace;
  # home.file.".config/zsh".source = ../config/zsh;
  home.file.".config/nvim".source = ../config/nvim;
  home.file.".config/btop".source = ../config/btop;
  home.file.".config/bat".source = ../config/bat;
}

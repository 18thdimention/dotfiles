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
			ga = "git add .";
			ta = "tmux attach";
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
			{
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
    ];

		autosuggestion.enable = true;
		initContent = ''
			export EDITOR="nvim"
			if [[ -f ~/.config/zsh/.zshrc ]]; then
				source ~/.config/zsh/.zshrc
			fi
			if command -v starship &> /dev/null; then
				eval "$(starship init zsh)"
			fi
			if [ -n "''${commands[fzf-share]}" ]; then
				source "$(fzf-share)/key-bindings.zsh"
				source "$(fzf-share)/completion.zsh"
			fi
		'';
	};

	programs.bat = {
		enable = true;
		config = {
# style = "plain";
			theme = "gruvbox-dark";
		};
	};


	programs.btop = {
		enable = true;
		settings = {
			color_theme = "gruvbox_dark";
			theme_background = false;
			update_ms = 2000;
			proc_sorting = "cpu";
		};
	};

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
		colors = {
			fg = "#ebdbb2";
			bg = "#282828";
			hl = "#fabd2f";
			"fg+" = "#ebdbb2";
			"bg+" = "#3c3836";
			"hl+" = "#fabd2f";
			info = "#83a598";
			prompt = "#bdae93";
			spinner = "#fabd2f";
			pointer = "#83a598";
			marker = "#fe8019";
			header = "#665c54";
		};
	};


  home.file.".config/ghostty".source = ../config/ghostty;
  home.file.".config/aerospace".source = ../config/aerospace;
  # home.file.".config/zsh".source = ../config/zsh;
  home.file.".config/nvim".source = ../config/nvim;
  home.file.".config/tmux".source = ../config/tmux;
	home.file.".config/starship.toml".source = ../config/starship/starship.toml;
	home.file.".config/yazi".source = ../config/yazi;
}

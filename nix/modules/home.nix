{ config, pkgs, ... }:

{
	home.username = "doyeon";
	home.homeDirectory = "/Users/doyeon";
	home.stateVersion = "24.05";
	home-manager.useGlobalPkgs = true;
	home-manager.useUserPackages = true;

	program.zsh = {
		enable = true;
		enableCompletion = true;
		plugins = [
		{
			name = "zsh-completions";
			src = pkgs.zsh-completions;
			file = "share/zsh/site-functions";
		}
		{
			name = "fzf-tab";
			src = pkgs.zsh-fzf-tab;
			file = "share/fzf-tab/fzf-tab.plugin.zsh";
		}
		];
		initContent = ''
			if [[ -f ~/.config/zsh/.zshrc ]]; then
				source ~/.config/zsh/.zshrc
			fi
		'';
	};

	home.packages = with pkgs; [
		home-manager

		git
		gcc
		neovim

		lua
		nodejs
		rustc
		cargo

		tailscale

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
	];

	home.file.".config/ghostty".source = ../config/ghostty;
	home.file.".config/zsh".source = ../config/zsh;
	home.file.".config/nvim".source = ../config/nvim;
	home.file.".config/btop".source = ../config/btop;
	home.file.".config/wallpapers".source = ../config/wallpapers;
}

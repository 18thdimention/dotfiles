{ config, pkgs, ... }:

{
	home.username = "doyeon";
	home.homeDirectory = "/Users/doyeon";
	home.stateVersion = "24.05";

	programs.fastfetch = {
		enable = true;

		settings = {
			logo = {
				type = "none";
			};

			display = {
				separator = " ";
				color = "90";
				size = {
					binaryPrefix = "jedec";
				};
				bar = {
					char = {
						elapsed = "󰝤";
						total = "󰝤";
					};
					width = 12;
				};
				percent = {
					type = [
						"num"
							"num-color"
							"bar"
					];
				};
			};

			modules = let
				content-width = (builtins.stringLength (user + host));
			extension = lib.concatStrings (lib.replicate (content-width - 7) "─");
			in [
			{
				key = "╭────────────${extension}╮";
				type = "custom";
			}
			{
				type = "title";
				format = "{#keys}│ {#34} {#37}{#1}${user}@${host}{#} {#keys}│";
			}
			{
				key = "├───────────┬${extension}╯";
				type = "custom";
			}
			{
				key = "│ {#34} {#37}distro  {#keys}│";
				type = "os";
			}
			{
				key = "│ {#34} {#37}wm      {#keys}│";
				type = "wm";
			}
			{
				key = "│ {#34} {#37}cpu     {#keys}│";
				type = "cpu";
				temp = true;
				format = "{name} [{cores-physical}C/{cores-logical}T] @ {freq-max} - {temperature}";
			}
			{
				key = "│ {#34} {#37}gpu     {#keys}│";
				type = "gpu";
				temp = true;
				driverSpecific = true;
				format = "{name} - {temperature}";
			}
			{
				key = "│ {#34} {#37}disk    {#keys}│";
				type = "disk";
				folders = "/";
				format = "{size-used} / {size-total} {size-percentage-bar} - {size-percentage}";
			}
			{
				key = "│ {#34} {#37}memory  {#keys}│";
				type = "memory";
				format = "{used} / {total} {percentage-bar} - {percentage}";
			}
			{
				key = "├───────────┼──────────────────────╮";
				type = "custom";
			}
			{
				key = "│ {#34} {#37}colors  {#keys}│";
				type = "custom";
				format = "{#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37}  {#keys}│";
			}
			{
				key = "╰───────────┴──────────────────────╯";
				type = "custom";
			}
			];
		};
	};

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
  home.file.".config/tmux".source = ../config/tmux;
  home.file.".config/btop".source = ../config/btop;
  home.file.".config/bat".source = ../config/bat;
}

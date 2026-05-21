{ config, pkgs, ... }:

{
  home.username = "doyeon";
  home.homeDirectory = "/Users/doyeon";
  home.stateVersion = "24.05";

  programs.git = {
    enable = true;

    userName = "18thdimention";
    userEmail = "doyeonxxxx@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
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

    initContent = ''
      if [[ -f ~/.config/zsh/.zshrc ]]; then
        source ~/.config/zsh/.zshrc
      fi
    '';
  };

  home.file.".config/ghostty".source = ../config/ghostty;
  home.file.".config/zsh".source = ../config/zsh;
  home.file.".config/nvim".source = ../config/nvim;
  home.file.".config/btop".source = ../config/btop;
}

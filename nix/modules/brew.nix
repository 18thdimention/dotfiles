{ ... }:
{
	homebrew = { 
		enable = true;
		user = "doyeon";
		
		taps = [];
		brews = [
			"sdl2"
			"sdl3"
			"sdl3_ttf"
			"llvm@15"
			"pkg-config"
			"luarocks"
			"lua"
			"python"
			"typst"
		];

		casks = [
			"claude-code"
			"zed"
			"mactex"
			"nikitabobko/tap/aerospace"
			"firefox"
			"obsidian"
			"ghostty"
			"raycast"
			"zotero"
			"tailscale"	
      "logseq"
			"discord"
			"ollama"
			"warp"
			"sqlitestudio"
			"font-zed-mono"
			"font-fira-mono-nerd-font"
			"shottr"
		];

		masApps = {
			"Microsoft Excel" = 462058435;
			"Microsoft Word" = 462054704;
			"Microsoft Outlook" = 985367838;
			"NordVPN: VPN Fast & Secure" = 905953485;
			"Kakaotalk" = 869223134;
			"Fantastical - Calendar" = 975937182;
		};
	};

	system.activationScripts.homebrewTrust.text = ''
    /opt/homebrew/bin/brew trust --cask nikitabobko/tap/aerospace || true
  '';
}

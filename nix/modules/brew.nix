{ ... }:
{
	homebrew = { 
		enable = true;
		user = "doyeon";
		
		taps = [];
		brews = [
			"sdl2"
			"sdl3"
			"llvm@15"
			"pkg-config"
			"anomalyco/tap/opencode"
			"luarocks"
			"lua"
			"python"
		];

		casks = [
			"zed"
			"mactex"
			"nikitabobko/tap/aerospace"
			"firefox"
			"obsidian"
			"ghostty"
			"raycast"
			"zotero"
			"tailscale"	
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
		};
	};
}

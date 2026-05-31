{ ... }:
{
	homebrew = { 
		enable = true;
		user = "doyeon";
		
		taps = [];
		brews = [
			"sdl2"
			"llvm@15"
			"pkg-config"
			"anomalyco/tap/opencode"
		];
		casks = [
			"helium-browser"
			"zed"
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
			"lm-studio"
			"sqlitestudio"
			"utm"
		];
		masApps = {
			"Microsoft Excel" = 462058435;
			"Microsoft Word" = 462054704;
			"Microsoft Outlook" = 985367838;
			"NordVPN: VPN Fast & Secure" = 905953485;
		};
	};
}

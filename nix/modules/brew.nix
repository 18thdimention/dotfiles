{ ... }:
{
	homebrew = { 
		enable = true;
		user = "doyeon";
		
		taps = [];
		brews = [
			"sdl2"
			"llvm@15"
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
		];
		masApps = {
			"Microsoft Excel" = 462058435;
			"Microsoft Word" = 462054704;
			"Microsoft Outlook" = 985367838;
			"NordVPN: VPN Fast & Secure" = 905953485;
		};
	};
}

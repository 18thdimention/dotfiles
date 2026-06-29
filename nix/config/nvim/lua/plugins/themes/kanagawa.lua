require('kanagawa').setup({
	compile = false,
	undercurl = true,
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true},
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = true,
	dimInactive = true,
	terminalColors = true,
	colors = {                   -- add/modify theme and palette colors
		palette = {
		},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
	overrides = function(colors) -- add/modify highlights
		return {}
	end,
	theme = "dragon",
	background = {
		dark = "dragon",
		light = "lotus"
	},
})

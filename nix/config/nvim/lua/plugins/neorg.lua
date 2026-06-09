return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	dependencies = {
		{ "vhyrro/luarocks.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "pysan3/pathlib.nvim" },
		{ "nvim-neorg/lua-utils.nvim" },
		{ "nvim-neotest/nvim-nio" },
		{ "nvim-neorg/tree-sitter-norg", build = ":TSUpdate norg" },
		{ "nvim-neorg/tree-sitter-norg_meta", build = ":TSUpdate norg_meta" },
	},
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							neorg = "~/neorg",
						},
					}
				},
				["core.concealer"] = {},
			}
		})
	end
}

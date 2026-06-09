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
	},
	config = function()
		vim.g.maplocalleader = ","
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.keybinds"] = {
					config = {
						default_keybinds = true,
						neorg_leader = ",",
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							neorg = "~/neorg",
						},
					}
				},
				["core.concealer"] = {
					config = {
						icon_preset = "varied",
					},
				},
			}
		})
	end
}

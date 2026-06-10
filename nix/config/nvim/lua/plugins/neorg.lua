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
				["core.pivot"] = {},
				["core.integrations.treesitter"] = {},
				["core.highlights"] = {},
				["core.autocommands"] = {},
				["core.qol.todo_items"] = {
					config = {
						create_todo_items = true,
					},
				},
				["core.ui"] = {},
				["core.ui.calendar"] = {},
				["core.latex.renderer"] = {
					config = {
						conceal = true,
						render_on_enter = false,
					}
				},
			}
		})
	end
}

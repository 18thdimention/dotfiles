return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter" },
		{ "vhyrro/luarocks.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "pysan3/pathlib.nvim" },
		{ "nvim-neorg/lua-utils.nvim" },
		{ "nvim-neotest/nvim-nio" },
		{ "3rd/image.nvim" },
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
						icon_preset = "diamond",
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
				["core.promo"] = {},
				["core.esupports.metagen"] = {},
				["core.syntax"] = {},
				["core.summary"] = {},
			}
		})
		vim.keymap.set("n", "<localleader>m", "<cmd>Neorg inject-metadata<CR>", { desc = "Inject metadata" })
	end
}

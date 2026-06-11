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
		{
			"3rd/image.nvim",
			opts = {
				backend = "kitty",
				integrations = {
					neorg = {
						enabled = true,
						clear_in_insert_mode = false,
						download_remote_images = true,
						only_render_image_at_cursor = false,
						filetypes = { "norg" },
					},
				},
				max_width = 100,
				max_height = 12,
				max_height_window_percentage = math.huge,
				max_width_window_percentage = math.huge,
				window_overlap_clear_enabled = false,
				window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "Directive" },
			},
		},
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
				["core.integrations.image"] = {},
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

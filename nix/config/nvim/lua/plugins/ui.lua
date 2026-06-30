return {
	{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
		config = function()
			require("ibl").setup()
		end
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					enabled = true,
				},

				messages = {
					enabled = false,
				},

				notify = {
					enabled = false,
				},
			})
		end,
	},

	{
		'stevearc/dressing.nvim',
		opts = {},
		config = function()
			require("dressing").setup()
		end
	},

	{
		"sphamba/smear-cursor.nvim",
		opts = {
			smear_between_buffers = true,
			smear_between_neighbor_lines = true,
			scroll_buffer_space = true,
			legacy_computing_symbols_support = false,
			smear_insert_mode = true,
		},
	},

	{
		'Bekaboo/dropbar.nvim',
		-- optional, but required for fuzzy finder support
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		},
		config = function()
			local dropbar_api = require('dropbar.api')
			vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
			vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
			vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
		end,
	},
}

return {
	{
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			'nvim-telescope/telescope-ui-select.nvim',
		},
		config = function()
			require('telescope').setup({
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = require('telescope.actions').move_selection_next,
							["<C-k>"] = require('telescope.actions').move_selection_previous,
						},
					},
					layout_strategy = "horizontal",
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")

		end,
	},

}

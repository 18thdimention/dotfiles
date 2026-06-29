return {
	'AlexvZyl/nordic.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require('nordic').load()
		require('nordic').setup({
			transparent = {
				-- Enable transparent background.
				bg = true,
				-- Enable transparent background for floating windows.
				float = true,
			},
		})

		vim.cmd.colorscheme('nordic')
	end
}

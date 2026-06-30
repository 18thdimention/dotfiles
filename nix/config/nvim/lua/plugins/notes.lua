return {
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		config = function()
			require('render-markdown').setup({
				completions = { lsp = { enabled = true } },
			})
		end
	},

	{
		'chomosuke/typst-preview.nvim',
		lazy = false, -- or ft = 'typst'
		version = '1.*',
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},
}

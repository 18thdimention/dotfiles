return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"clangd",
					"pyright",
					"gopls",
					"rust_analyzer",
					"tinymist",
					"marksman",
				},
			})
		end,
	},
}

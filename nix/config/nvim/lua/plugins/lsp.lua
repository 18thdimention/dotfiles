return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"folke/lazydev.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.lsp.config("*", { capabilities = vim.lsp.protocol.make_client_capabilities() })
		require("mason").setup()
		require("mason-lspconfig").setup({ ---@diagnostic disable-line
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"eslint",
				"gopls",
				"ts_ls",
			},
		})
		require("lazydev").setup({ ---@diagnostic disable-line
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		})
	end,
}

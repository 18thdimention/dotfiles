return {
	"neovim/nvim-lspconfig",
	dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
		"folke/lazydev.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
    -- create default capabilities object for later use by language servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if ok_cmp and cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end
    -- expose for other modules to use when setting up lsp servers
    local caps_mod = require("config.lsp_capabilities")
    caps_mod.set(capabilities)
    -- ensure mason is available and configured
    require("mason").setup()
		require("mason-lspconfig").setup({ ---@diagnostic disable-line
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"eslint",
			},
		})
		require("lazydev").setup({ ---@diagnostic disable-line
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		})
	end,
}

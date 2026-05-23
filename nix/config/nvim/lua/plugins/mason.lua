return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				firewall = {
					enabled = true
				}
			})
		end
	},
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "clangd",
					"eslint",
        }
      })
    end
  },
	{
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}

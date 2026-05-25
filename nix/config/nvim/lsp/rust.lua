local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local caps_mod = pcall(require, "config.lsp_capabilities") and require("config.lsp_capabilities") or nil
local capabilities = caps_mod and caps_mod.get() or vim.lsp.protocol.make_client_capabilities()

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {},
  },
})

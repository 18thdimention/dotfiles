local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local capabilities = vim.g.lsp_capabilities
if type(capabilities) ~= "table" then
  capabilities = vim.lsp.protocol.make_client_capabilities()
end

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {},
  },
})

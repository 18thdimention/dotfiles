local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local caps_mod = pcall(require, "config.lsp_capabilities") and require("config.lsp_capabilities") or nil
local capabilities = caps_mod and caps_mod.get() or vim.lsp.protocol.make_client_capabilities()

local function on_attach_disable_copilot(client, bufnr)
  -- disable Copilot for Rust buffers (works with copilot.vim by setting buffer var)
  pcall(function()
    vim.api.nvim_buf_set_var(bufnr, "copilot_enabled", false)
  end)
end

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach_disable_copilot,
  settings = {
    ["rust-analyzer"] = {},
  },
})

local M = {}

M._capabilities = nil

function M.set(cap)
  M._capabilities = cap
end

function M.get()
  if type(M._capabilities) == "table" then
    return M._capabilities
  end
  return vim.lsp.protocol.make_client_capabilities()
end

return M

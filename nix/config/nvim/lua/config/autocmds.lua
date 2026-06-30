-- format before saving
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    vim.lsp.buf.format({
      bufnr = args.buf,
      timeout_ms = 2000,
    })
  end,
})

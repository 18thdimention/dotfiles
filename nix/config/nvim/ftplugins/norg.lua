vim.treesitter.start()

-- Enable concealing for Neorg
vim.opt_local.conceallevel = 2
vim.opt_local.foldlevel = 99

-- Turn off any diagnostics that might accidentally pop up
vim.diagnostic.enable(false, { bufnr = 0 })

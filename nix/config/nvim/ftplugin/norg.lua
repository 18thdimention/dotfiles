vim.treesitter.start()

-- Enable concealing for Neorg
vim.opt_local.conceallevel = 2
vim.opt_local.foldlevel = 99

-- Turn off any diagnostics that might accidentally pop up
vim.diagnostic.enable(false, { bufnr = 0 })

-- Add local leader + t mapping to insert inline LaTeX math blocks
vim.keymap.set("n", "<localleader>t", "i$|  |$<Left><Left><Left>", { buffer = true, desc = "Insert inline LaTeX math" })
vim.keymap.set("i", "<localleader>t", "$|  |$<Left><Left><Left>", { buffer = true, desc = "Insert inline LaTeX math" })

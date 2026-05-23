	return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = {
		-- current_line_blame = true,
		trouble = true,
		preview_config = {},
		on_attach = function(bufnr)
			vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk_inline<CR>", { buffer = bufnr })
			vim.keymap.set("n", "<leader>hb", "<cmd>Gitsigns blame_line<CR>", { buffer = bufnr })
			vim.keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { buffer = bufnr })
			vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { buffer = bufnr })
			vim.keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", { buffer = bufnr })
			vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { buffer = bufnr })
			vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { buffer = bufnr })
			vim.keymap.set("n", "<leader>xh", "<cmd>Gitsigns setqflist<CR>", { buffer = bufnr })
		end,
	},
}

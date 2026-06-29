require("oil").setup({
	default_file_explorer = true,
	columns = {
		"icon",
		-- "permissions",
		"size",
		-- "mtime",
	},
	use_default_keymaps = true,
	view_options = {
		show_hidden = true,
		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},
	}
})

vim.keymap.set({ "n" }, "<leader>e", "<cmd>Oil<CR>")

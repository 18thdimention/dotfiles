return {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = "FloatermToggle",
		config = function()
			vim.keymap.set("n", "<leader>ft", "<cmd>FloatermToggle<cr>", { desc = "Toggle Floaterm" })
		end
}

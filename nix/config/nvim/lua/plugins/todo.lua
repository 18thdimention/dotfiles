return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},

	config = function()
		vim.keymap.set("n", "]t", function()
			require("todo-comments").jump_next()
		end, { desc = "Next todo comment" })

		vim.keymap.set("n", "[t", function()
			require("todo-comments").jump_prev()
		end, { desc = "Previous todo comment" })

		vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Todo Telescope" })
	end
}

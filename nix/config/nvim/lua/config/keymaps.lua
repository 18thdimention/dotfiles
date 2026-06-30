vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set('n', '<leader>nh', ':nohlsearch<CR>')

-- undotree
vim.keymap.set("n", "<leader>u", ":lua require('undotree').toggle()<cr>")

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", function()
	mark.add_file()
end, { desc = "Harpoon: add file" })

vim.keymap.set("n", "<C-e>", function()
	ui.toggle_quick_menu()
end, { desc = "Harpoon: toggle quick menu" })

-- lazygit
vim.keymap.set("n", "<leader>lg", ":LazyGit<cr>", { desc = "LazyGit" })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- todo telescope
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Todo Telescope" })


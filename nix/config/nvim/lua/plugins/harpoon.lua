return {
	'ThePrimeagen/harpoon',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
    config = function()
        require("harpoon").setup()
        -- Use harpoon submodules directly instead of relying on a global `harpoon` variable
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", function()
            mark.add_file()
        end, { desc = "Harpoon: add file" })

        vim.keymap.set("n", "<C-e>", function()
            ui.toggle_quick_menu()
        end, { desc = "Harpoon: toggle quick menu" })
    end
}

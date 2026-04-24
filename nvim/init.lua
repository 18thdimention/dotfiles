vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
vim.cmd([[hi @lsp.type.number gui=bold]])
vim.opt.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showtabline = 0
vim.opt.signcolumn = "yes"
vim.opt.wrap = true 
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.clipboard = "unnamedplus"

local plugins = {
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "0.1.8" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
}

if vim.pack and vim.pack.add then
	vim.pack.add(plugins)
else
	local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if vim.uv.fs_stat(lazy_path) then
		vim.opt.rtp:prepend(lazy_path)
		local lazy_plugins = {}
		for _, plugin in ipairs(plugins) do
			local repo = plugin.src:gsub("^https://github.com/", "")
			local spec = { repo }
			if plugin.version == "main" then
				spec.branch = "main"
			elseif plugin.version then
				spec.tag = plugin.version
			end
			table.insert(lazy_plugins, spec)
		end
		require("lazy").setup(lazy_plugins)
	end
end


vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'markdown', 'lua', 'rust', 'typescript', 'javascript', 'c', 'cpp', 'python', "typescriptreact", "react" },
	callback = function() pcall(vim.treesitter.start) end,
})


local has_mason, mason = pcall(require, "mason")
if has_mason then
	mason.setup()
end

local has_telescope, telescope = pcall(require, "telescope")
local default_color = "vague"
if has_telescope then
	telescope.setup({
		defaults = {
			preview = { treesitter = true },
			color_devicons = true,
			sorting_strategy = "ascending",
			borderchars = {
				"", -- top
				"", -- right
				"", -- bottom
				"", -- left
				"", -- top-left
				"", -- top-right
				"", -- bottom-right
				"", -- bottom-lef
			},
			path_displays = { "smart" },
			layout_config = {
				height = 100,
				width = 400,
				prompt_position = "top",
				preview_cutoff = 40,
			}
		}
	})

	-- telescope.load_extension("ui-select")
end

vim.cmd [[set completeopt+=menuone,noselect,popup]]

vim.lsp.enable({
	"lua_ls", "cssls", "rust_analyzer", "clangd",
})

local has_oil, oil = pcall(require, "oil")
if has_oil then
	oil.setup({
		lsp_file_methods = {
			enabled = true,
			timeout_ms = 1000,
			autosave_changes = true,
		},
		columns = {
			"icon",
		},
		float = {
			max_width = 0.3,
			max_height = 0.6,
			border = "rounded",
		},
		view_options = {
			show_hidden = true,
		}
	})
end

local has_vague, vague = pcall(require, "vague")
if has_vague then
	vague.setup({ transparent = true })
end

local has_luasnip, luasnip = pcall(require, "luasnip")
if has_luasnip then
	luasnip.setup({ enable_autosnippets = true })
end

local colors = {}
local map = vim.keymap.set
local current = 1

vim.g.mapleader = " "

map({ "n", "t" }, "<Leader>x", "<Cmd>tabclose<CR>")

local opts = { noremap = true, silent = true }

map({ "n" }, "<leader>e", "<cmd>Oil<CR>")
vim.cmd('colorscheme ' .. default_color)

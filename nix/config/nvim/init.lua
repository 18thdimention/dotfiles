vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
vim.cmd([[hi @lsp.type.number gui=bold]])
vim.cmd [[set completeopt+=menuone,noselect,popup]]

vim.g.mapleader = " "

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

vim.g.maplocalleader = ","

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set('n', '<leader>nh', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>n', ":Neorg workspace neorg<CR>")

vim.cmd.colorscheme('nordic')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
	},

	{
		"jiaoshijie/undotree",
		opts = {
			-- your options
		},
		keys = { -- load the plugin only when using it's keybinding:
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},

	{
		'ThePrimeagen/harpoon',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
	},

	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},

	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate'
	},

	{
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
	},

	{
		'Bekaboo/dropbar.nvim',
		-- optional, but required for fuzzy finder support
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			fast_wrap = {
				chars = { "{", "[", "(", '"', "'", "`" },
				map = "<M-l>",
				keys = "asdfghjklqwertyuiop",
				pattern = [=[[%'%"%)%>%]%)%}%,]]=],
				check_comma = true,
				end_key = "L",
				highlight = "PmenuSel",
				hightlight_grey = "NonText",
			},
			check_ts = true,
			enable_check_bracket_line = true,
		},
	},

	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			position='left'
			-- Your setup opts here
		},
	},

	{
		"sphamba/smear-cursor.nvim",
		opts = {
			smear_between_buffers = true,
			smear_between_neighbor_lines = true,
			scroll_buffer_space = true,
			legacy_computing_symbols_support = false,
			smear_insert_mode = true,
		},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		cmd = {
			"tmuxnavigateleft",
			"tmuxnavigatedown",
			"tmuxnavigateup",
			"tmuxnavigateright",
			"tmuxnavigateprevious",
			"tmuxnavigatorprocesslist",
		},
		keys = {
			{ "<c-h>", "<cmd><c-u>tmuxnavigateleft<cr>" },
			{ "<c-j>", "<cmd><c-u>tmuxnavigatedown<cr>" },
			{ "<c-k>", "<cmd><c-u>tmuxnavigateup<cr>" },
			{ "<c-l>", "<cmd><c-u>tmuxnavigateright<cr>" },
			{ "<c-\\>", "<cmd><c-u>tmuxnavigateprevious<cr>" },
		},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},

	{
		'chomosuke/typst-preview.nvim',
		lazy = false, -- or ft = 'typst'
		version = '1.*',
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	},

	{
		'nvim-mini/mini.cursorword',
		version = '*',
		config = function()
			require('mini.cursorword').setup()
		end
	},

	{
		"nvim-mini/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end
	},

	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true },
	{'AlexvZyl/nordic.nvim', lazy = false, priority = 1000 },
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },

	{
		rocks = {
			enabled = false,
		},
		lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
		install = { colorscheme = { "kanagawa" } },
	}
})


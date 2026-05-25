return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = "VeryLazy",
	config = function()
		local zenbones = require("zenbones.colors")
		local colors = {
			fg = zenbones.theme.ui.fg,
			bg = #000000,
			fg_dark = zenbones.theme.ui.fg_dim,
			green = zenbones.palette.autumnGreen,
			orange = zenbones.palette.surimiOrange,
			red = zenbones.palette.autumnRed,
			yellow = zenbones.palette.roninYellow,
			cyan = zenbones.palette.dragonBlue,
		}
		local lualine = require('lualine')

		local config = {
			options = {
				-- Disable sections and component separators
				component_separators = '',
				section_separators = '',
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section. Both are highlighted by c theme .  So we
					-- are just setting default looks o statusline
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}
		
		-- Helper Functions	
		local function insert_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function insert_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			buffer_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) == 1
			end,
			screen_width = function(min_w)
				return function()
					return vim.o.columns > min_w
				end
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
			diff_mode = function()
				return vim.o.diff == true
			end,
		}

		insert_left({
			"branch",
			icon = "",
			color = { fg = colors.fg, bg = colors.bg, gui = "bold" },
		})

		insert_left({
			"diff",
			symbols = { added = " ", modified = " ", removed = " " },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.screen_width(80),
		})

		insert_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				error = { fg = colors.red },
				warn = { fg = colors.yellow },
				info = { fg = colors.cyan },
			},
		})

		insert_left({
			function()
				return "%="
			end,
		})

		insert_right({
			"location",
			color = { fg = colors.fg_dark },
			cond = conditions.buffer_not_empty,
		})

		insert_right({
			"encoding",
		})

		insert_right({
			"filetype",
		})

		lualine.setup(config)
	end,
}

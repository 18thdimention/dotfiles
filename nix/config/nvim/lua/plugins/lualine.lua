return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = "VeryLazy",
	config = function()
        -- Try to load zenbones colors module; provide a sensible fallback
        local function num_to_hex(n)
            if not n then return nil end
            return string.format('#%06x', n)
        end

        local zenbones
        do
            local ok, mod = pcall(require, 'zenbones.colors')
            if ok and mod then
                zenbones = mod
            else
                local ok2, mod2 = pcall(require, 'zenbones')
                if ok2 and mod2 then
                    zenbones = mod2
                else
                    -- Fallback: derive some colors from the 'Normal' highlight and use small palette
                    local hl = vim.api.nvim_get_hl(0, { name = 'Normal' })
                    local fg_num = hl.foreground or hl.fg
                    local bg_num = hl.background or hl.bg
                    local fg = num_to_hex(fg_num) or '#abb2bf'
                    local fg_dim = '#7f848e'
                    zenbones = {
                        theme = { ui = { fg = fg, fg_dim = fg_dim } },
                        palette = {
                            autumnGreen = '#98be65',
                            surimiOrange = '#FF8800',
                            autumnRed = '#ec5f67',
                            roninYellow = '#FFCC66',
                            dragonBlue = '#6fb3d2',
                        },
                    }
                end
            end
        end
        -- Safely read values from zenbones (it may be nil or have different shape)
        local theme_ui = (zenbones and zenbones.theme and zenbones.theme.ui) or {}
        local palette = (zenbones and zenbones.palette) or {}

        local colors = {
            fg = theme_ui.fg or '#abb2bf',
            bg = "#000000",
            fg_dark = theme_ui.fg_dim or '#7f848e',
            green = palette.autumnGreen or '#98be65',
            orange = palette.surimiOrange or '#FF8800',
            red = palette.autumnRed or '#ec5f67',
            yellow = palette.roninYellow or '#FFCC66',
            cyan = palette.dragonBlue or '#6fb3d2',
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

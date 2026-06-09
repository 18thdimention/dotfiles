return {
	"rebelot/heirline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		local conditions = require("heirline.conditions")
		local utils = require("heirline.utils")

		-- Space filler
		local Space = { provider = " " }

		-- Filename component
		local FileName = {
			provider = function()
				local filename = vim.fn.expand("%:t")
				if filename == "" then return "[No Name]" end
				return filename
			end,
			hl = { fg = "none", bg = "NONE", bold = true },
		}

		local FileFlags = {
			{
				condition = function()
					return vim.bo.modified
				end,
				provider = " [+] ",
				hl = { fg = "#b8bb26", bg = "NONE" }, -- GruvboxGreen
			},
			{
				condition = function()
					return not vim.bo.modifiable or vim.bo.readonly
				end,
				provider = "  ",
				hl = { fg = "#dfaf87", bg = "NONE" }, -- GruvboxOrange (warn)
			},
		}

		local FileNameBlock = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
		}
		
		-- Combine filename and flags
		FileNameBlock = utils.insert(FileNameBlock,
			Space,
			FileName,
			FileFlags
		)

		-- Git status component
		local Git = {
			condition = conditions.is_git_repo,
			init = function(self)
				self.status_dict = vim.b.gitsigns_status_dict
				self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
			end,
			hl = { bg = "NONE" },
			{
				-- Branch name
				provider = function(self)
					return "  " .. self.status_dict.head .. " "
				end,
				hl = { fg = "#d3869b", bold = true }, -- GruvboxPurple
			},
			{
				provider = function(self)
					local count = self.status_dict.added or 0
					return count > 0 and ("+" .. count .. " ")
				end,
				hl = { fg = "#8EC07C" }, -- GruvboxAqua
			},
			{
				provider = function(self)
					local count = self.status_dict.changed or 0
					return count > 0 and ("~" .. count .. " ")
				end,
				hl = { fg = "#fabd2f" }, -- GruvboxYellow
			},
			{
				provider = function(self)
					local count = self.status_dict.removed or 0
					return count > 0 and ("-" .. count .. " ")
				end,
				hl = { fg = "#fb4934" }, -- GruvboxRed
			},
		}

		-- Alignment component to push everything else to the sides
		local Align = { provider = "%=" }

		-- The full statusline
		local StatusLine = {
			hl = { bg = "NONE" }, -- This makes the overall background transparent
			FileNameBlock,
			Align,
			Git,
			Space,
		}

		-- Setup Heirline
		require("heirline").setup({
			statusline = StatusLine,
		})

		-- Ensure Neovim's built-in StatusLine highlight group is transparent
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", ctermbg = "NONE" })
	end,
}
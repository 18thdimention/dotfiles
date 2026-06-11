return {
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
}

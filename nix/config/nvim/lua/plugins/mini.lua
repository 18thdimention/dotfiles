return {
	{
		'nvim-mini/mini.cursorword',
		version = '*',
		config = function()
			require('mini.cursorword').setup()
		end
	},
	{ 'nvim-mini/mini.surround', version = '*' },
	{
		'nvim-mini/mini.cmdline',
		version = '*',
		config = function()
			require('mini.cmdline').setup()
		end,
	},
	{
		'nvim-mini/mini.statusline',
		version = '*',
		config = function()
			require('mini.statusline').setup()
		end,
	},
	{
		'nvim-mini/mini.diff', 
		version = '*',
		config = function()
			require('mini.diff').setup()
		end
	},
}

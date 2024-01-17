return {
	{
		'nvim-lualine/lualine.nvim', -- Provides a nice status bar at the bottom of the screen
		opts = {
			options = { theme = 'auto' },
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { { 'filename', path = 1 } },
				lualine_x = { 'filetype' },
				lualine_y = {},
				lualine_z = { 'location' }
			}
		}
	},
}

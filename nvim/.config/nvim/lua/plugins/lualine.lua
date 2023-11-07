return {
	{
		'nvim-lualine/lualine.nvim', -- Provides a nice status bar at the bottom of the screen
		opts = {
			options = { theme = 'auto' },
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'hostname', 'filename', 'progress' },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = {}
			}
		}
	},
}

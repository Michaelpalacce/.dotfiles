return {
	{
		'nvim-lualine/lualine.nvim', -- Provides a nice status bar at the bottom of the screen
		dependencies = {
			'AndreM222/copilot-lualine'
		},
		opts = {
			options = {
				theme = 'auto',
				icons_enabled = true,
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { { 'filename', path = 1 } },
				lualine_x = { {
					'copilot', show_colors = true
				} },
				lualine_y = { 'filetype' },
				lualine_z = { 'location' }
			}
		}
	},
}

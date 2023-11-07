return {
	{ 'nvim-lua/plenary.nvim' },                      -- Set of tools for lua

	{ 'Mofiqul/dracula.nvim',       as = 'dracula' }, -- Theme
	{ "catppuccin/nvim",            as = "catppuccin" }, -- Theme
	{ 'doums/darcula',              as = 'darcula' }, -- Theme

	{ 'nvim-tree/nvim-web-devicons' },                -- Does some magic so we can have icons.
	{
		'nvim-lualine/lualine.nvim',                  -- Provides a nice status bar at the bottom of the screen
		opts = {
			options = { theme = 'auto' },
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'hostname', 'filename', 'progress' },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
			}
		}
	},
}

return {
	{
		'sudormrfbin/cheatsheet.nvim', -- Cheatsheet for nvim
		dependencies = {
			{ 'nvim-telescope/telescope.nvim' },
			-- { 'nvim-lua/popup.nvim' }, -- Not needed, install if any issues arise?
			{ 'nvim-lua/plenary.nvim' },
		},
		keys = {
			{ '<leader>fC', '<cmd>Cheatsheet<CR>', { desc = '[F]ind In [C]heatsheet' } }
		},
	}
}

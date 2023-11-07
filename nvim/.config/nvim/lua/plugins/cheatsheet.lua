return {
	{
		'sudormrfbin/cheatsheet.nvim', -- Cheatsheet for nvim
		dependencies = {
			{ 'nvim-telescope/telescope.nvim' },
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' },
		},
		config = function()
			vim.keymap.set('n', '<leader>fc', '<cmd>Cheatsheet<CR>', { desc = 'Telescope: [F]ind In [C]heatsheet' })
		end
	}
}

return {

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		'sudormrfbin/cheatsheet.nvim',
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

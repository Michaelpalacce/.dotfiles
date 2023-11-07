return {

	{ 'folke/which-key.nvim' }, -- Show tooltips what key combinations you can do
	{
		'sudormrfbin/cheatsheet.nvim',
		dependencies = {
			{ 'nvim-telescope/telescope.nvim' },
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' },
		}
	}
}

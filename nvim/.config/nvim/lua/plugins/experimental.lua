return {
	-- This plugin is used to stop inactive LSP servers after a certain period of time
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {
			notifications = true,
			grace_period = 180
		}
	},
	-- This plugin is used to colorize hex codes and color names in the buffer
	{
		'NvChad/nvim-colorizer.lua',
		config = true
	}
}

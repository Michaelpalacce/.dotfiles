return {
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {
			notifications = true,
			grace_period = 180
		}
	},
}

return {
	-- This plugin is used to stop inactive LSP servers after a certain period of time
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {
			notifications = true,
			grace_period = 360,
			excluded_lsp_clients = { "copilot", "null-ls", "jdtls", "marksman" }
		}
	},
}

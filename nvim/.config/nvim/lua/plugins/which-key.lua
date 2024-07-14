return {
	{
		"folke/which-key.nvim", -- Shows a popup of key combinations
		event = "VeryLazy",
		commit = "af4ded85542d40e190014c732fa051bdbf88be3d",
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
}

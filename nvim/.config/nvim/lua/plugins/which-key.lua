return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			delay = 0,
			preset = "classic",
			modes = {
				n = true, -- Normal mode
				i = true, -- Insert mode
				x = false, -- Visual mode
				s = true, -- Select mode
				o = true, -- Operator pending mode
				t = true, -- Terminal mode
				c = true -- Command mode
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	}
}

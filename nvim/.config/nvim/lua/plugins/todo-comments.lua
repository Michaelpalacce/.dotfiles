return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set('n', "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = '[T]oggle [T]odo Comments' })
			require("todo-comments").setup {}
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	}
}

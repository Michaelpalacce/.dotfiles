return {
	{
		"nvim-pack/nvim-spectre",
		config = function()
			vim.keymap.set('n', '<leader>tS', '<cmd>lua require("spectre").toggle()<CR>', { desc = "[T]oggle [S]pectre" })

			require('spectre').setup()
		end
	},
}

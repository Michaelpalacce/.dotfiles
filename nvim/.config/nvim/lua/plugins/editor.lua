return {
	{ 'nvim-treesitter/nvim-treesitter-context' }, -- Provides a nice context of where you are
	{ 'mbbill/undotree' },                      -- Nice undo visualization
	{
		"akinsho/toggleterm.nvim",
		config = function()
			vim.keymap.set('n', '<leader>tn', vim.cmd.ToggleTerm, { desc = "[T]oggle Termi[n]al" })
			require("toggleterm").setup {
				direction = 'horizontal'
				-- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
			}
		end
	},                        -- Nice terminal
	{ 'numToStr/Comment.nvim' }, -- Easy Commenting
	{ 'RRethy/vim-illuminate' }, -- illuminates similar vars
	{ 'windwp/nvim-autopairs' }, -- Autopairs
}

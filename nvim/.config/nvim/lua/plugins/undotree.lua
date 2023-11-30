return {
	{
		'mbbill/undotree',
		event = "BufRead",
		config = function()
			vim.keymap.set('n', '<leader>tu', vim.cmd.UndotreeToggle, { desc = "[T]oggle [U]ndotree" })
		end
	}, -- Nice undo visualization
}

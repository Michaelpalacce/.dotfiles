return {
	-- Nice undo visualization
	{
		'mbbill/undotree',
		event = "BufRead",
		keys = {
			{ "<leader>tu", function() vim.cmd.UndotreeToggle() end, desc = "Undotree: [T]oggle [U]ndotree" },
		},
	},
}

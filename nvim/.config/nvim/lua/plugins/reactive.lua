return {
	-- This plugin changes the line colors
	{
		'rasulomaroff/reactive.nvim',
		event = 'BufRead',
		config = function()
			require('reactive').setup {
				builtin = {
					cursorline = true,
					cursor = true,
					modemsg = true
				}
			}
		end
	},
}

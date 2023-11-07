return {
	{
		'ggandor/leap.nvim', -- Easily go to text
		dependencies = { 'tpope/vim-repeat' },
		event = "BufRead",
		config = function()
			-- `s` to search ahead
			-- `S` to search behind
			require('leap').add_default_mappings()
		end
	}
}

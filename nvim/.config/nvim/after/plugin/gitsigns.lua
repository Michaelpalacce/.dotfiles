require('gitsigns').setup {
	current_line_blame      = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 500,
		ignore_whitespace = false,
	},
	signcolumn              = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl                   = true, -- Toggle with `:Gitsigns toggle_numhl`
	linehl                  = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff               = false, -- Toggle with `:Gitsigns toggle_word_diff`
}

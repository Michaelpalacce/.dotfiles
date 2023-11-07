return {
	{
		'tpope/vim-fugitive',
		config = function()
			local builtin = require('telescope.builtin')
			-- Yes we depend on telescope boiiiiiiiiiiiiiiiiiii. Yes it is hidden

			vim.keymap.set('n', "<leader>gs", vim.cmd.Git, { desc = '[T]oggle [G]it Status' })
			vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope: [G]it [B]ranches' })
			vim.keymap.set('n', '<leader>gd', builtin.git_status, { desc = 'Telescope: [G]it [D]iff' })

			vim.keymap.set('n', "<leader>gp", function()
				vim.cmd.Git('push')
			end, { desc = "Fugitive: [G]it [P]ush", remap = false })

			vim.keymap.set("n", "<leader>gP", function()
				vim.cmd.Git('pull')
			end, { remap = false, desc = "Fugitive: [G]it [P]ull" })
		end
	}, -- Git operations
	{
		'lewis6991/gitsigns.nvim',
		opts = {
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
	}                               -- Show Signs in the gutter
}

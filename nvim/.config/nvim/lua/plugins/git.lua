return {
	{
		'tpope/vim-fugitive', -- Git operations
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
	},
	{
		'lewis6991/gitsigns.nvim', -- Show Signs in the gutter
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
			on_attach               = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map('n', ']c', function()
					if vim.wo.diff then return ']c' end
					vim.schedule(function() gs.next_hunk() end)
					return '<Ignore>'
				end, { expr = true })

				map('n', '[c', function()
					if vim.wo.diff then return '[c' end
					vim.schedule(function() gs.prev_hunk() end)
					return '<Ignore>'
				end, { expr = true })

				-- Actions
				map('n', '<leader>hs', gs.stage_hunk)
				map('n', '<leader>hr', gs.reset_hunk)
				map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
				map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
				map('n', '<leader>hS', gs.stage_buffer)
				map('n', '<leader>hu', gs.undo_stage_hunk)
				map('n', '<leader>hR', gs.reset_buffer)
				map('n', '<leader>hp', gs.preview_hunk)
				map('n', '<leader>hb', function() gs.blame_line { full = true } end)
				map('n', '<leader>tb', gs.toggle_current_line_blame)
				map('n', '<leader>hd', gs.diffthis)
				map('n', '<leader>hD', function() gs.diffthis('~') end)
				map('n', '<leader>td', gs.toggle_deleted)

				-- Text object
				map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
			end
		},
		config = true,
	}
}

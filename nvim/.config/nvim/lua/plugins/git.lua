return {
	{
		'tpope/vim-fugitive', -- Git operations
		config = function()
			local builtin = require('telescope.builtin')

			-- Note: <C-w>7- is a hack to make the window smaller
			vim.keymap.set('n', "<leader>gs", "<cmd>G <CR><C-w>7-", { desc = 'Fugitive: [G]it [S]tatus' })
			vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope: [G]it [B]ranches' })
			vim.keymap.set('n', '<leader>gd', builtin.git_status, { desc = 'Telescope: [G]it [D]iff' })
			vim.keymap.set('n', '<leader>gc', builtin.git_bcommits, { desc = 'Telescope: [G]it buffer [C]ommits' })
			vim.keymap.set('n', '<leader>gC', builtin.git_commits, { desc = 'Telescope: [G]it [C]ommits' })

			vim.keymap.set('n', "<leader>gp", function()
				vim.cmd.Git('push')
			end, { desc = "Fugitive: [G]it [P]ush", remap = false })

			vim.keymap.set("n", "<leader>gP", function()
				vim.cmd.Git('pull --rebase')
			end, { remap = false, desc = "Fugitive: [G]it [P]ull" })

			vim.keymap.set("n", "<leader>gl", function()
				vim.cmd.Git('log --follow -- ' .. vim.fn.expand('%'))
			end, { remap = false, desc = "Fugitive: [G]it [L]og --follow (per file)" })

			vim.keymap.set("n", "<leader>gL", function()
				vim.cmd.Git('log')
			end, { remap = false, desc = "Fugitive: [G]it [L]og (per repo)" })
		end,
		dependencies = {
			'nvim-telescope/telescope.nvim'
		}
	},
	{
		'lewis6991/gitsigns.nvim', -- Show Signs in the gutter
		event = "BufRead",
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
				map('n', '<leader>hs', gs.stage_hunk, { desc = 'GitSigns: [H]unk [S]tage' })
				map('n', '<leader>hr', gs.reset_hunk, { desc = 'GitSigns: [H]unk [R]eset' })
				map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
					{ desc = 'GitSigns: [H]unk [S]tage' })
				map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
					{ desc = 'GistSigns: [H]unk [R]eset' })
				map('n', '<leader>hS', gs.stage_buffer, { desc = "GitSigns: [H]unk [S]tage buffer" })
				map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "GitSigns: [H]unk [U]ndo stage hunk" })
				map('n', '<leader>hR', gs.reset_buffer, { desc = "GitSigns: [H]unk [R]eset buffer" })
				map('n', '<leader>hp', gs.preview_hunk, { desc = "GitSigns: [H]unk [P]review" })
				map('n', '<leader>hb', function() gs.blame_line { full = true } end,
					{ desc = "GitSigns: [H]unk [B]lame" })
				map('n', '<leader>hd', gs.diffthis, { desc = "GitSigns: [H]unk [D]iff" })
			end
		},
		config = true,
	}
}

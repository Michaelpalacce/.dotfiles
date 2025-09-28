return {
	{
		'tpope/vim-fugitive', -- Git operations
		event = "VeryLazy",
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		keys = {
			{ "<leader>gs", vim.cmd.Git, desc = "Fugitive: [G]it [S]tatus" },
			{
				"<leader>gt",
				function()
					require('fzf-lua').git_tags()
				end,
				desc = "Fzf-Lua: [G]it [T]ags"
			},
			{
				"<leader>gb",
				function()
					require('fzf-lua').git_branches()
				end,
				desc = "Fzf-Lua: [G]it [B]ranches"
			},
			{
				"<leader>gS",
				function()
					require('fzf-lua').git_stash()
				end,
				desc = "Fzf-Lua: [G]it [S]tash"
			},
			{
				"<leader>gd",
				function()
					require('fzf-lua').git_status()
				end,
				desc = "Fzf-Lua: [G]it [D]iff"
			},
			{
				"<leader>gp",
				function()
					vim.cmd.Git('push')
				end,
				desc = "Fugitive: [G]it [P]ush"
			},
			{
				"<leader>gP",
				function()
					vim.cmd.Git('pull --rebase')
				end,
				desc = "Fugitive: [G]it [P]ull"
			},
			{
				"<leader>gl",
				function()
					vim.cmd.GcLog('--follow -- ' .. vim.fn.expand('%'))
				end,
				desc = "Fugitive: [G]it [L]og --follow (per file)"
			},
			{
				"<leader>gL",
				function()
					vim.cmd.GcLog()
				end,
				desc = "Fugitive: [G]it [L]og (per repo)"
			},
		},
	},

	{
		'lewis6991/gitsigns.nvim', -- Show Signs in the gutter
		opts = {
			current_line_blame      = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = 'eol',
				delay = 500,
				ignore_whitespace = false,
			},
			max_file_length         = 10000, -- Disable gitsigns if a file is longer than 10k

			signcolumn              = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl                   = true, -- Toggle with `:Gitsigns toggle_numhl`
			linehl                  = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff               = false, -- Toggle with `:Gitsigns toggle_word_diff`
			auto_attach             = true,
			on_attach               = function(bufnr)
				local gs = require('gitsigns')

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
				map('n', '<leader>hR', gs.reset_buffer, { desc = "GitSigns: [H]unk [R]eset buffer" })

				map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "GitSigns: [H]unk [U]ndo stage hunk" })

				map('n', '<leader>hp', gs.preview_hunk, { desc = "GitSigns: [H]unk [P]review" })
				map('n', '<leader>hb', function() gs.blame_line { full = true } end,
					{ desc = "GitSigns: [H]unk [B]lame" })
				map('n', '<leader>hd', gs.diffthis, { desc = "GitSigns: [H]unk [D]iff" })
			end
		},
		config = true,
	}
}

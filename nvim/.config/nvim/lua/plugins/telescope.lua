return {
	{
		'nvim-telescope/telescope.nvim', -- Provides nice file jumping Capabilities
		config = function()
			-- local builtin = require('telescope.builtin')
			-- local actions = require('telescope.actions')
			--
			-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: [F]ind [F]iles' })
			-- vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Telescope: [F]inder [R]esume' })
			-- vim.keymap.set('n', '<leader>fs', builtin.live_grep,
			-- 	{ desc = 'Telescope: [F]ind Word in Project [S]cope (live grep)' })
			-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: [F]ind [H]elp Tags' })
			-- vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope: [F]ind [G]it files' })
			-- vim.keymap.set('n', '<leader>ft', builtin.colorscheme,
			-- 	{ desc = 'Telescope: [F]ind and Select [T]heme (colorscheme)' })
			-- vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Telescope: [F]ind In The [Q]uickfix List' })
			-- vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope: [F]ind [K]eymaps' })
			-- vim.keymap.set('n', '<leader>fo', builtin.vim_options, { desc = 'Telescope: [F]ind Vim [O]ptions' })
			-- vim.keymap.set('n', '<leader>fp', builtin.reloader, { desc = 'Telescope: [F]ind [P]lugins To reload' })
			-- vim.keymap.set('n', '<leader>fR', builtin.registers, { desc = 'Telescope: [F]ind in [R^]egsiters' })
			-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: [F]ind [B]uffers' })
			require('telescope').setup {
				-- pickers = {
				-- 	git_branches = {
				-- 		mappings = {
				-- 			i = {
				-- 				-- This will checkout and track the branch instead of just checking out in detached state
				-- 				["<cr>"] = actions.git_switch_branch
				-- 			}
				-- 		}
				-- 	}
				-- },
				-- defaults = {
				-- 	-- This will show enough directories so we can distinguish duplicates easily
				-- 	path_display = { 'smart' },
				-- 	dynamic_preview_title = true,
				-- 	results_title = 'Your Results Milord',
				-- 	layout_config = {
				-- 		horizontal = {
				-- 			width = 0.95
				-- 		}
				-- 	}
				-- }
			}
		end,
	}
}

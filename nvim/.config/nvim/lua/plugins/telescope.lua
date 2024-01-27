return {
	{
		'nvim-telescope/telescope.nvim', -- Provides nice file jumping Capabilities
		event = 'VeryLazy',
		config = function()
			local builtin = require('telescope.builtin')
			local actions = require('telescope.actions')

			local multi_rg = require "plugins.telescope.multi-rg"

			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: [F]ind [F]iles' })
			vim.keymap.set('n', '<leader>fF', builtin.oldfiles, { desc = 'Telescope: [F]ind [O]ldfiles' })
			vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Telescope: [F]inder [R]esume' })
			vim.keymap.set('n', '<leader>fs', builtin.live_grep,
				{ desc = 'Telescope: [F]ind [S]tring' })
			vim.keymap.set('n', '<leader>fS', multi_rg, { desc = 'Telescope: [F]ind [S]tring With Superpowers' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: [F]ind [H]elp Tags' })
			vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope: [F]ind [G]it files' })
			vim.keymap.set('n', '<leader>fT', builtin.colorscheme,
				{ desc = 'Telescope: [F]ind and Select [T]heme (colorscheme)' })
			vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Telescope: [F]ind In The [Q]uickfix List' })
			vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope: [F]ind [K]eymaps' })
			vim.keymap.set('n', '<leader>fo', builtin.vim_options, { desc = 'Telescope: [F]ind Vim [O]ptions' })
			vim.keymap.set('n', '<leader>fp', builtin.reloader, { desc = 'Telescope: [F]ind [P]lugins To reload' })
			vim.keymap.set('n', '<leader>fR', builtin.registers, { desc = 'Telescope: [F]ind in [R^]egsiters' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: [F]ind [B]uffers' })
			vim.keymap.set("n", "<Leader><tab>", "<Cmd>lua require('telescope.builtin').commands()<CR>",
				{ desc = "Telescope: Commands", noremap = false })

			require('telescope').setup {
				pickers = {
					find_files = {
						hidden = true
					},
					live_grep = {
						hidden = true
					},
					git_branches = {
						mappings = {
							i = {
								-- This will checkout and track the branch instead of just checking out in detached state
								["<cr>"] = actions.git_switch_branch
							}
						}
					},
				},
				defaults = {
					-- This will show enough directories so we can distinguish duplicates easily
					path_display = { 'smart' },
					dynamic_preview_title = true,
					results_title = 'Your Results Milord',
					vimgrep_arguments = {
						'rg',
						'--hidden',
						'--ignore',
						'--color=never',
						'--no-heading',
						'--with-filename',
						'--line-number',
						'--column',
						'--smart-case',
						'--glob=!.git',
					},
					layout_config = {
						horizontal = {
							width = 0.95
						}
					}
				}
			}
		end,
	}
}

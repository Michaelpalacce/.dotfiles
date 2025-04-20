return {

	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local fzfLua = require('fzf-lua')
			local actions = fzfLua.actions

			vim.api.nvim_create_autocmd("VimResized", {
				pattern = '*',
				command = 'lua require("fzf-lua").redraw()'
			})

			vim.keymap.set('n', '<leader>ff', fzfLua.files, { desc = 'Fzf-Lua: [F]ind [F]iles' })
			vim.keymap.set('n', '<leader>fF', fzfLua.oldfiles, { desc = 'Fzf-Lua: [F]ind Oldfiles' })
			vim.keymap.set('n', '<leader>fr', fzfLua.resume, { desc = 'Fzf-Lua: [F]inder [R]esume' })
			vim.keymap.set('n', '<leader>fs', fzfLua.live_grep, { desc = 'Fzf-Lua: [F]ind [S]tring' })
			vim.keymap.set('n', '<leader>fh', fzfLua.helptags, { desc = 'Fzf-Lua: [F]ind [H]elp Tags' })
			vim.keymap.set('n', '<leader>fg', fzfLua.git_files, { desc = 'Fzf-Lua: [F]ind [G]it files' })
			vim.keymap.set('n', '<leader>fc', fzfLua.grep_curbuf, { desc = 'Fzf-Lua: [F]ind [C]urrent file' })
			vim.keymap.set('n', '<leader>fq', fzfLua.quickfix, { desc = 'Fzf-Lua: [F]ind In The [Q]uickfix List' })
			vim.keymap.set('n', '<leader>fk', fzfLua.keymaps, { desc = 'Fzf-Lua: [F]ind [K]eymaps' })
			vim.keymap.set('n', '<leader>fo', fzfLua.nvim_options, { desc = 'Fzf-Lua: [F]ind Vim [O]ptions' })
			vim.keymap.set('n', '<leader>fR', fzfLua.registers, { desc = 'Fzf-Lua: [F]ind in [R^]egsiters' })
			vim.keymap.set('n', '<leader>fb', fzfLua.buffers, { desc = 'Fzf-Lua: [F]ind [B]uffers' })
			vim.keymap.set("n", "<Leader><tab>", fzfLua.commands,
				{ desc = "Fzf-Lua: Commands", noremap = false })

			require('fzf-lua').setup {
				"telescope",
				-- MISC GLOBAL SETUP OPTIONS, SEE BELOW
				-- fzf_bin = ...,
				-- each of these options can also be passed as function that return options table
				-- e.g. winopts = function() return { ... } end
				fzf_opts = {
					['--keep-right'] = '',
					['--history'] = vim.fn.stdpath("data") .. '/fzf-lua-history',
				},
				winopts = {
					-- split = "belowright new",-- open in a split instead?
					-- "belowright new"  : split below
					-- "aboveleft new"   : split above
					-- "belowright vnew" : split right
					-- "aboveleft vnew   : split left
					-- Only valid when using a float window
					-- (i.e. when 'split' is not defined, default)
					height     = 0.85, -- window height
					width      = 0.95, -- window width
					row        = 0.35, -- window row position (0=top, 1=bottom)
					col        = 0.50, -- window col position (0=left, 1=right)
					-- border argument passthrough to nvim_open_win()
					border     = "rounded",
					-- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
					backdrop   = 60,
					-- title         = "Title",
					-- title_pos     = "center",        -- 'left', 'center' or 'right'
					-- title_flags   = false,           -- uncomment to disable title flags
					fullscreen = false, -- start fullscreen?
					-- enable treesitter highlighting for the main fzf window will only have
					-- effect where grep like results are present, i.e. "file:line:col:text"
					-- due to highlight color collisions will also override `fzf_colors`
					-- set `fzf_colors=false` or `fzf_colors.hl=...` to override
					treesitter = {
						enabled    = true,
						fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
					},
					on_create  = function()
						-- called once upon creation of the fzf main window
						-- can be used to add custom fzf-lua mappings, e.g:
						--   vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
					end,
				},
				keymap = {
					fzf = {
						-- fzf '--bind=' options
						-- true,        -- uncomment to inherit all the below in your custom config
						["ctrl-z"]     = "abort",
						["ctrl-u"]     = "unix-line-discard",
						["ctrl-f"]     = "half-page-down",
						["ctrl-b"]     = "half-page-up",
						["ctrl-a"]     = "beginning-of-line",
						["ctrl-e"]     = "end-of-line",
						["ctrl-q"]     = "select-all+accept",
						["alt-a"]      = "toggle-all",
						["alt-g"]      = "first",
						["alt-G"]      = "last",
						-- Only valid with fzf previewers (bat/cat/git/etc)
						["f3"]         = "toggle-preview-wrap",
						["f4"]         = "toggle-preview",
						["shift-down"] = "preview-page-down",
						["shift-up"]   = "preview-page-up",
					},
				}, -- Neovim keymaps / fzf binds
				picker = {
					files = {
						prompt       = 'Files❯ ',
						multiprocess = true, -- run command in a separate process
						git_icons    = true, -- show git icons?
						file_icons   = true, -- show file icons (true|"devicons"|"mini")?
						color_icons  = true, -- colorize file|git icons
						hidden       = true, -- enable hidden files by default
					},
					manpages = { previewer = "man_native" },
					helptags = { previewer = "help_native" },
				}
			}
		end
	},
}

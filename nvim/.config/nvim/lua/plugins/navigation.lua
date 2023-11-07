return {
	{
		'nvim-telescope/telescope.nvim', -- Provides nice file jumping Capabilities
		config = function()
			local builtin = require('telescope.builtin')
			local actions = require('telescope.actions')

			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: [F]ind [F]iles' })
			vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Telescope: [F]inder [R]esume' })
			vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope: [F]ind Word in Project [S]cope (live grep)' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: [F]ind [H]elp Tags' })
			vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope: [F]ind [G]it files' })
			vim.keymap.set('n', '<leader>ft', builtin.colorscheme, { desc = 'Telescope: [F]ind and Select [T]heme (colorscheme)' })
			vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Telescope: [F]ind In The [Q]uickfix List' })
			vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope: [F]ind [K]eymaps' })
			vim.keymap.set('n', '<leader>fo', builtin.vim_options, { desc = 'Telescope: [F]ind Vim [O]ptions' })
			vim.keymap.set('n', '<leader>fp', builtin.reloader, { desc = 'Telescope: [F]ind [P]lugins To reload' })
			vim.keymap.set('n', '<leader>fR', builtin.registers, { desc = 'Telescope: [F]ind in [R^]egsiters' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: [F]ind [B]uffers' })
			require('telescope').setup {
				pickers = {
					git_branches = {
						mappings = {
							i = {
								-- This will checkout and track the branch instead of just checking out in detached state
								["<cr>"] = actions.git_switch_branch
							}
						}
					}
				},
				defaults = {
					-- This will show enough directories so we can distinguish duplicates easily
					path_display = { 'smart' },
					dynamic_preview_title = true,
					results_title = 'Your Results Milord',
					layout_config = {
						horizontal = {
							width = 0.95
						}
					}
				}
			}
		end,
	},
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }, -- Provides syntax highlighting
	{
		'ThePrimeagen/harpoon',                              -- Allows for easier jumping between files
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[A]dd File To Harpoon" })
			vim.keymap.set("n", "<leader>th", ui.toggle_quick_menu, { desc = "[T]oggle [H]arpoon" })
			vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon: 1" })
			vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon: 2" })
			vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon: 3" })
			vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon: 4" })
			vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = "Harpoon: 5" })
			vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end, { desc = "Harpoon: 6" })
			vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end, { desc = "Harpoon: 7" })
			vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end, { desc = "Harpoon: 8" })
			vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end, { desc = "Harpoon: 9" })
			vim.keymap.set("n", "<leader>0", function() ui.nav_file(0) end, { desc = "Harpoon: 0" })
			vim.keymap.set("n", "<leader>p", function() ui.nav_prev() end, { desc = "Harpoon: Go To Previous" })
			vim.keymap.set("n", "<leader>n", function() ui.nav_next() end, { desc = "Harpoon: Go To Next" })
		end
	},
	{
		'nvim-tree/nvim-tree.lua', -- Shows a nice file tree
		config = function()
			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true
			vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle, { desc = "[T]oggle Nvim [T]ree" })

			local function change_root_to_global_cwd()
				local api = require("nvim-tree.api")
				local global_cwd = vim.fn.getcwd(-1, -1)
				api.tree.change_root(global_cwd)
			end

			local function my_on_attach(bufnr)
				local api = require "nvim-tree.api"

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
				vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
				vim.keymap.set('n', '<C-c>', change_root_to_global_cwd, opts('Change Root To Global CWD'))
			end

			local api = require("nvim-tree.api")
			api.events.subscribe(api.events.Event.FileCreated, function(file)
				vim.cmd("edit " .. file.fname)
			end)

			-- OR setup with some options
			require("nvim-tree").setup({
				sync_root_with_cwd = true,
				respect_buf_cwd = true,

				sort_by = "case_sensitive",
				view = {
					width = 45,
				},
				update_focused_file = {
					enable = true,
					-- update_root = true,
					ignore_list = {},
				},
				diagnostics = {
					enable = true,
					show_on_dirs = false,
					show_on_open_dirs = true,
					debounce_delay = 50,
					severity = {
						min = vim.diagnostic.severity.HINT,
						max = vim.diagnostic.severity.ERROR,
					},
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				renderer = {
					group_empty = true,
					icons = {
						webdev_colors = true,
						git_placement = "before",
						modified_placement = "after",
						padding = " ",
						symlink_arrow = " ➛ ",
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
							modified = true,
						},
						glyphs = {
							default = "",
							symlink = "",
							bookmark = "󰆤",
							modified = "●",
							folder = {
								arrow_closed = "",
								arrow_open = "",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "◌",
							},
						},
					},
					special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
					symlink_destination = true,
				},
				filters = {
					dotfiles = false,
				},
				git = {
					enable = true,
					ignore = false,
					timeout = 500,
				},
				on_attach = my_on_attach,
			})
		end
	},
	{
		'ggandor/leap.nvim', -- Easily go to text
		dependencies = { 'tpope/vim-repeat' },
		config = function()
			-- `s` to search ahead
			-- `S` to search behind
			require('leap').add_default_mappings()
		end
	}
}

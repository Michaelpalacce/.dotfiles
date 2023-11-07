return {
	{ 'nvim-tree/nvim-web-devicons' }, -- Does some magic so we can have icons.
	{
		'nvim-tree/nvim-tree.lua',  -- Shows a nice file tree
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
}

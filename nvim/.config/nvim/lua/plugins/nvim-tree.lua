return {
	{ 'nvim-tree/nvim-web-devicons' }, -- Does some magic so we can have icons.
	{
		'nvim-tree/nvim-tree.lua',  -- Shows a nice file tree
		config = function()
			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true
			vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle, { desc = "[T]oggle Nvim [T]ree" })

			local function grep_at_current_tree_node()
				local node = require('nvim-tree.lib').get_node_at_cursor()
				if not node then return end
				require('telescope.builtin').live_grep({ search_dirs = { node.absolute_path } })
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
				vim.keymap.set('n', '<C-s>', grep_at_current_tree_node, opts('Search under current file'))
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
					group_empty = false,
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
return {
	{ 'nvim-tree/nvim-web-devicons' }, -- Does some magic so we can have icons.
	{
		'nvim-tree/nvim-tree.lua',  -- Shows a nice file tree
		config = function()
			local api = require "nvim-tree.api"

			-- Do a fzf-lua live_grep under the current node
			local function grep_at_current_tree_node()
				local node = api.tree.get_node_under_cursor()
				if not node then return end

				require("fzf-lua").live_grep({ cwd = node.absolute_path })
			end

			-- Custom mappings for nvim-tree
			local function customAttach(bufnr)
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
				vim.keymap.set('n', '<C-f>', grep_at_current_tree_node, opts('Search under current file'))
			end

			-- Open a file when it's created
			api.events.subscribe(api.events.Event.FileCreated, function(file)
				vim.cmd("edit " .. file.fname)
			end)

			-- Remap to easily toggle the tree view
			vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle, { desc = "[T]oggle Nvim [T]ree" })

			-- OR setup with some options
			require("nvim-tree").setup({
				sync_root_with_cwd = true,
				respect_buf_cwd = true,

				sort_by = "case_sensitive",
				view = {
					width = {
						min = 45,
						max = 70
					}
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
					highlight_git = true
				},
				actions = {
					change_dir = {
						-- Cannot go BACK from root
						restrict_above_cwd = true
					}
				},
				filters = {
					dotfiles = false,
				},
				git = {
					enable = true,
					ignore = false,
					timeout = 250,
				},
				on_attach = customAttach,
			})
		end
	},
}

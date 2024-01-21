return {
	{ 'nvim-tree/nvim-web-devicons' }, -- Does some magic so we can have icons.
	{
		'nvim-tree/nvim-tree.lua',  -- Shows a nice file tree
		config = function()
			local api = require "nvim-tree.api"
			local lib = require 'nvim-tree.lib'
			local utils = require "nvim-tree.utils"

			-- -- Auto Preview Start
			-- -- Get a count of visible buffers outside of the tree
			-- function has_multiple_visible_buffers()
			-- 	local count = 0
			-- 	for _, winid in ipairs(vim.api.nvim_list_wins()) do
			-- 		local bufnr = vim.fn.winbufnr(winid)
			-- 		if bufnr ~= -1 then
			-- 			local bufname = vim.fn.bufname(bufnr)
			-- 			if not (vim.fn.fnamemodify(bufname, ":t"):match("^NvimTree_[0-9]+$")
			-- 					and (vim.bo[bufnr].filetype == "NvimTree" or vim.fn.filereadable(bufname) == 0)) then
			-- 				count = count + 1
			-- 			end
			-- 		end
			-- 	end
			-- 	return count
			-- end
			--
			-- local forbidden_preview_dirs = { "node_modules", ".git", "target" }
			--
			-- -- Open the preview window when moving the cursor
			-- -- only if the node is a file
			-- -- and only if there is only one visible buffer
			-- -- Also, make sure that we don't preview folders in the forbidden_preview_dirs
			-- vim.api.nvim_create_autocmd("CursorMoved", {
			-- 	pattern = "NvimTree_*",
			-- 	callback = function()
			-- 		utils.debounce("Buf:modified", 50, function()
			-- 			if has_multiple_visible_buffers() == 1 then
			-- 				local node = api.tree.get_node_under_cursor()
			--
			-- 				if node.nodes == nil then
			-- 					local preview = true
			-- 					for _, forbidden_preview_dir in ipairs(forbidden_preview_dirs) do
			-- 						if string.find(node.absolute_path, forbidden_preview_dir) then
			-- 							preview = false
			-- 						end
			-- 					end
			--
			-- 					if preview then
			-- 						api.node.open.preview()
			-- 					end
			-- 				end
			-- 			end
			-- 		end)
			-- 	end
			-- })
			-- -- Auto Preview End

			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true

			-- Do a telescope live_grep under the current node
			local function grep_at_current_tree_node()
				local node = lib.get_node_at_cursor()
				if not node then return end
				require('telescope.builtin').live_grep({ search_dirs = { node.absolute_path } })
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
					timeout = 500,
				},
				on_attach = customAttach,
			})
		end
	},
}

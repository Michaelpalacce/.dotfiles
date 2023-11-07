return {
	{
		'nvim-treesitter/nvim-treesitter', -- Provides syntax highlighting
		build = ':TSUpdate',
		opts = {
			-- A list of parser names, or "all"
			ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			highlight = {
				enable = true,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-e>", -- set to `false` to disable one of the mappings
					node_incremental = "<C-e>",
					node_decremental = "<C-x>",
				},
			},
			autotag = {
				enable = true,
			}
		},
		config = true
	},
	{
		'nvim-treesitter/nvim-treesitter-context', -- Provides a nice context of where you are
		config = true
	},
	{
		'nvim-lualine/lualine.nvim', -- Provides a nice status bar at the bottom of the screen
		opts = {
			options = { theme = 'auto' },
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'hostname', 'filename', 'progress' },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
			}
		}
	},
	{
		'mbbill/undotree',
		config = function()
			vim.keymap.set('n', '<leader>tu', vim.cmd.UndotreeToggle, { desc = "[T]oggle [U]ndotree" })
		end
	}, -- Nice undo visualization
	{
		"akinsho/toggleterm.nvim",
		config = function()
			vim.keymap.set('n', '<leader>tn', vim.cmd.ToggleTerm, { desc = "[T]oggle Termi[n]al" })
			require("toggleterm").setup {
				direction = 'horizontal'
				-- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
			}
		end
	},                     -- Nice terminal
	{
		'numToStr/Comment.nvim', -- Easy Commenting
		config = true,
	},
	{
		'windwp/nvim-autopairs', -- Autopairs
		config = true
	},
}

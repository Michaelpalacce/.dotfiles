return {
	{
		'nvim-treesitter/nvim-treesitter', -- Provides syntax highlighting
		build = ':TSUpdate',
		lazy = false,
		branch = "master", -- `main` is not good
		config = function()
			require 'nvim-treesitter.configs'.setup {
				-- A list of parser names, or "all"
				ensure_installed = {},
				ignore_install = {},
				modules = {},

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
					additional_vim_regex_highlighting = true,
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
				},
			}
		end
	},
	{
		'nvim-treesitter/nvim-treesitter-context', -- Provides a nice context of where you are
		config = true,
		event = "BufRead"
	},
}

return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = true
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Debugging capabilities
			{
				'mfussenegger/nvim-dap',
				dependencies = {
					'rcarriga/nvim-dap-ui',
					'leoluz/nvim-dap-go'
				}
			},

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' },
			{ 'petertriho/cmp-git' },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },

			-- Icons
			{ 'onsails/lspkind.nvim' },

			-- Testing
			{
				"nvim-neotest/neotest",
				dependencies = {
					'vim-test/vim-test',
					'nvim-neotest/neotest-vim-test',
					"nvim-lua/plenary.nvim",
					"antoinemadec/FixCursorHold.nvim",
					"nvim-treesitter/nvim-treesitter",
					"nvim-neotest/neotest-go",
				},
				config = function()
				end
			},

			-- Langauges
			-- LUA
			{
				"folke/neodev.nvim",
				opts = {},
				-- Lazy load only when needed
				ft = "lua",
			},

		},
		config = function()
			-- ##########################################################
			-- Load All LSP configs
			-- ##########################################################

			require "plugins.lsp.lsp-zero" -- Contains all the LSP configs
			require "plugins.lsp.languages" -- Contains all the language specific configs

			-- ##########################################################
			-- Completion
			-- ##########################################################

			require "plugins.lsp.cmp" -- Contains all the completion configs

			-- ##########################################################
			-- Testing
			-- ##########################################################

			require "plugins.lsp.testing" -- Contains all the testing configs

			-- ##########################################################
			-- Debugging
			-- ##########################################################

			require "plugins.lsp.dap" -- Contains all the debugging configs
		end
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.0.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		build = "make install_jsregexp",
		dependencies = {
			{ 'rafamadriz/friendly-snippets' },
			{ 'saadparwaiz1/cmp_luasnip' },
		},
		config = function()
			require "plugins.lsp.luasnip"
		end,
	},

}

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

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },

			-- Icons
			{ 'onsails/lspkind.nvim' },

			-- Debugging capabilities
			{
				'mfussenegger/nvim-dap',
				dependencies = {
					'nvim-neotest/nvim-nio',
					'rcarriga/nvim-dap-ui',
					'leoluz/nvim-dap-go'
				},
				ft = { "go", "gomod" },
				config = function()
					-- ##########################################################
					-- Debugging
					-- ##########################################################

					require "plugins.lsp.dap" -- Contains all the debugging configs
				end
			},

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
				event = "VeryLazy",
				config = function()
					-- ##########################################################
					-- Testing
					-- ##########################################################

					require "plugins.lsp.testing"
				end
			},

			{
				"folke/neodev.nvim",
				opts = {}
			}
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
		end
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.0.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		build = "make install_jsregexp",
		event = "VeryLazy",
		dependencies = {
			-- { 'rafamadriz/friendly-snippets' },
			{ 'saadparwaiz1/cmp_luasnip' },
		},
		config = function()
			require "plugins.lsp.luasnip"
		end,
	},

}

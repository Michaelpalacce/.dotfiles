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
			{ 'mfussenegger/nvim-dap' },

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

			-- Formatting
			{ 'onsails/lspkind.nvim' },

			-- Langauges
			-- LUA
			{ "folke/neodev.nvim",                  opts = {} },

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

			require "plugins.lsp.cmp"
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
			{ 'tamago324/nlsp-settings.nvim' },
		},
		config = function()
			require "plugins.lsp.luasnip"
		end,
	},

}

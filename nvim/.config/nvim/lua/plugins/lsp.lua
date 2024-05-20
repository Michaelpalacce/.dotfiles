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

}

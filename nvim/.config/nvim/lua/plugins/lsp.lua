return {
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
			{ 'petertriho/cmp-git' }
		}
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
			{ 'tamago324/nlsp-settings.nvim' }
		}
	},

	{ 'j-hui/fidget.nvim',  tag = 'legacy' },                                -- Shows a spinner of lsp loading
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }, -- Workspace Diagnostics

}

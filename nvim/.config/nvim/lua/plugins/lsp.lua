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

			-- Foramtting
			{
				"stevearc/conform.nvim",
				event = { "BufWritePre" },
				cmd = { "ConformInfo" },
				keys = {
					{
						-- Customize or remove this keymap to your liking
						"<F3>",
						function()
							require("conform").format({ async = true, lsp_fallback = true })
						end,
						mode = "",
						desc = "Format buffer",
					},
				},
				-- Everything in opts will be passed to setup()
				opts = {
					-- Define your formatters
					formatters_by_ft = {
						javascript = { { "prettierd" } },
						typescript = { { "prettierd" } }
					},
					-- Set up format-on-save
					format_on_save = { timeout_ms = 500, lsp_fallback = true },
					-- Customize formatters
					formatters = {
						-- shfmt = {
						-- 	prepend_args = { "-i", "2" },
						-- },
					},
				},
				init = function()
					-- If you want the formatexpr, here is the place to set it
					vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
				end,
			},

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

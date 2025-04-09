return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = true
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' },

			-- Icons
			{ 'onsails/lspkind.nvim' },
		},
		event = 'InsertEnter',
		config = function()
			-- ##########################################################
			-- Completion
			-- ##########################################################

			require "plugins.lsp.cmp" -- Contains all the completion configs
		end
	},
	-- Using `nvim-lspconfig` to manage LSP configuration as they have amazing default support
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Language Specifics
			{ 'towolf/vim-helm',                  ft = 'helm' },
			{ 'b0o/schemastore.nvim' }
		},
		config = function()
			-- Remove https://gpanders.com/blog/whats-new-in-neovim-0-11/#more-default-mappings
			pcall(vim.keymap.del, "n", "gra")
			pcall(vim.keymap.del, "n", "gri")
			pcall(vim.keymap.del, "n", "grn")
			pcall(vim.keymap.del, "n", "grr")

			-- lsp_attach is where you enable features that only work
			-- if there is a language server active in the file
			local lsp_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
				vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				-- If you are searching for formatting, it's done by the plugin `conform.nvim`
				vim.keymap.set({ 'n', 'v' }, '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

				vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
				vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
				vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
			end

			-- Diagnostics show different messages in case errors are found
			vim.diagnostic.config({
				virtual_text = { severity = { max = vim.diagnostic.severity.WARN, }, }, -- Virtual text at the end of the line
				virtual_lines = { severity = { min = vim.diagnostic.severity.ERROR, }, }, -- line under the line
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = '✘',
						[vim.diagnostic.severity.WARN] = '▲',
						[vim.diagnostic.severity.INFO] = '⚑',
						[vim.diagnostic.severity.HINT] = '»',
					},
				},
				float = {
					border = "rounded",
					source = "if_many",
				},
			})

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('global.lsp', { clear = true }),
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
					local bufnr = args.buf

					lsp_attach(client, bufnr)
				end
			})

			vim.lsp.config("*", {
				capabilities = require('cmp_nvim_lsp').default_capabilities(),
			})

			-- ##########################################################
			-- Languages
			-- ##########################################################

			require "plugins.lsp.languages" -- Contains all the completion configs
		end
	}
}

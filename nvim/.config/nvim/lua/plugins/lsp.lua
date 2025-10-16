local require_all = require("helpers.require_all").require_all

return {
	{
		'mason-org/mason.nvim',
		lazy = false,
		config = true
	},
	-- Using `nvim-lspconfig` to manage LSP configuration as they have amazing default support
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'mason-org/mason.nvim' },
			{ 'mason-org/mason-lspconfig.nvim' },

			-- Language Specifics
			{ 'towolf/vim-helm',               ft = 'helm' },
			{ 'b0o/schemastore.nvim' }
		},
		keys = {
			{ "<leader>Lr", function() vim.cmd.LspRestart() end, desc = "Reload", },
			{ "<leader>Li", function() vim.cmd.LspInfo() end,    desc = "Info", },
		},
		config = function()
			-- Remove https://gpanders.com/blog/whats-new-in-neovim-0-11/#more-default-mappings
			pcall(vim.keymap.del, "n", "gri")
			pcall(vim.keymap.del, "n", "gra")
			pcall(vim.keymap.del, "n", "grn")
			pcall(vim.keymap.del, "n", "grr")
			pcall(vim.keymap.del, "n", "grc")
			pcall(vim.keymap.del, "n", "grt")
			pcall(vim.keymap.del, "n", "gra")

			-- lsp_attach is where you enable features that only work
			-- if there is a language server active in the file
			local lsp_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)

				vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				vim.keymap.set({ 'n', 'v' }, '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				-- If you are searching for formatting, it's done by the plugin `conform.nvim`

				vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
			end

			-- Diagnostics show different messages in case errors are found
			vim.diagnostic.config({
				virtual_text = { severity = { max = vim.diagnostic.severity.ERROR, }, }, -- Virtual text at the end of the line
				virtual_lines = false,
				-- virtual_lines = { severity = { min = vim.diagnostic.severity.ERROR, }, }, -- line under the line
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

			require('mason-lspconfig').setup {
				ensure_installed = {
					-- Vum/Lua
					"lua_ls",
					"vimls",
					"selene",

					-- Kube
					"helm_ls",

					-- Scripting
					"shellcheck",
					"bashls",

					-- Go
					"delve",
					"gopls",
					"golangci-lint",

					-- Config Languages
					"jsonls",
					"yamlls",
					"lemminx", -- xml
					"html",

					-- JS/TS
					"ts_ls",

					-- Terraform
					"tflint",
					"tfsec",
					"terraformls",
				},
				automatic_enable = true,
			}

			-- Assuming your directory is ~/.config/nvim/lua/lsp
			require_all('lua/lsp')
		end
	}
}

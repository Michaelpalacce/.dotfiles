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
			{ 'petertriho/cmp-git' },
			{ "L3MON4D3/LuaSnip" }
		},
		config = function()
			local lsp = require('lsp-zero')

			require('mason-lspconfig').setup {
				ensure_installed = {
					'tsserver',
					'eslint',
					'lua_ls',
					'jsonls',
					'yamlls',
					'vimls',
					'volar',
					'lemminx'
				},
				handlers = {
					lsp.default_setup
				}
			}

			-- I need to configure this shit on my own... I don't want the default mappings... stolen from: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#minimal
			lsp.preset({
				float_border = 'rounded',
				call_servers = 'local',
				configure_diagnostics = true,
				setup_servers_on_start = true,
				set_lsp_keymaps = false,
				manage_nvim_cmp = {
					set_sources = 'recommended',
					set_basic_mappings = true,
					set_extra_mappings = false,
					use_luasnip = true,
					set_format = true,
					documentation_window = true,
				},
			})


			lsp.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
				vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
				vim.keymap.set({ 'n', 'v' }, '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

				vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
				vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
				vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
			end)

			-- ##########################################################
			-- Load All LSP configs
			-- ##########################################################


			-- (Optional) Configure lua language server for neovim
			require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

			-- TSSERVER

			require('lspconfig').tsserver.setup({
				settings = {
					completions = {
						completeFunctionCalls = true
					},
					typescript = {
						format = {
							semicolons = 'insert',
							tabsize = 4,
							trimTrailingWhitespace = true,
							convertTabsToSpaces = false,
						}
					},
					javascript = {
						inlayHints = {},
					},
				}
			})


			-- VOLAR (VUE)

			require('lspconfig').volar.setup {}

			-- GOLANG

			require('lspconfig').gopls.setup({
				cmd = { "gopls", "serve" },
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			})

			vim.api.nvim_create_autocmd('BufWritePre', {
				pattern = '*.go',
				callback = function()
					vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
				end
			})

			-- END

			-- Formatting

			lsp.format_on_save({
				format_opts = {
					async = false,
					timeout_ms = 5000,
				},
				servers = {
					['lua_ls']   = { 'lua' },
					['tsserver'] = { 'typescript' }
				}
			})

			lsp.set_sign_icons({
				error = '✘',
				warn = '▲',
				hint = '⚑',
				info = '»'
			})

			lsp.setup()

			-- ##########################################################
			-- Completion
			-- ##########################################################

			-- You need to setup `cmp` after lsp-zero
			local cmp = require('cmp')
			-- local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
			local cmp_action = require('lsp-zero').cmp_action()

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end
				},
				mapping = {
					-- `Enter` key to confirm completion
					['<CR>'] = cmp.mapping.confirm({ select = false }),

					-- Ctrl+Space to trigger completion menu
					['<C-Space>'] = cmp.mapping.complete(),

					-- If the completion menu is visible it will navigate to the next item in the list.
					-- If the cursor is on top of a "snippet trigger" it'll expand it.
					-- If the cursor can jump to a snippet placeholder, it moves to it.
					-- If the cursor is in the middle of a word it displays the completion menu
					['<Tab>'] = cmp_action.luasnip_supertab(),
					['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

					-- Disable up and down... I want to move
					['<Up>'] = cmp.mapping.close(),
					['<Down>'] = cmp.mapping.close(),
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'buffer' },
					{ name = 'nvim_lua' },
					{ name = 'path' },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' }
				}),
				window = {
					completion = require("stef.helpers.lsp").bordered({
						max_width = 3000,
						max_height = 3000
					}),
					documentation = require("stef.helpers.lsp").bordered({
						max_width = 3000,
						max_height = 3000
					}),
				},
				matching = {
					dissallow_fuzzy_matching = false
				}
			})


			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				}, {
					{ name = 'buffer' },
				})
			})
			require("cmp_git").setup()

			-- `/` cmdline setup.
			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})



			-- `:` cmdline setup.
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{
						name = 'cmdline',
						option = {
							ignore_cmds = { 'Man', '!' }
						}
					}
				})
			})
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
			{ 'tamago324/nlsp-settings.nvim' }
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end
	},

}

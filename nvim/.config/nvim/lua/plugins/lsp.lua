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
			-- Java....
			{ 'nvim-java/nvim-java' },

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

			-- Snippets
			{ "L3MON4D3/LuaSnip" },

			-- Formatting
			{ 'onsails/lspkind.nvim' }
		},
		config = function()
			-- ##########################################################
			-- Load All LSP configs
			-- ##########################################################

			require "plugins.configs.lspconfig"

			-- ##########################################################
			-- Completion
			-- ##########################################################

			require "plugins.configs.cmp"
		end
	},
	{
		'nvim-java/nvim-java',
		dependencies = {
			'nvim-java/lua-async-await',
			'nvim-java/nvim-java-core',
			'nvim-java/nvim-java-test',
			'nvim-java/nvim-java-dap',
			'MunifTanjim/nui.nvim',
			'neovim/nvim-lspconfig',
			'mfussenegger/nvim-dap',
			{
				'williamboman/mason.nvim',
				opts = {
					registries = {
						'github:nvim-java/mason-registry',
						'github:mason-org/mason-registry',
					},
				},
			}
		},
		config = function()
			require('java').setup()
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
			local ls = require("luasnip")
			local types = require("luasnip.util.types")
			local snippets = require("stef.snippets")

			---#Config
			ls.config.set_config({
				-- Edit the snippet even after I exit it
				history = true,
				-- Update snippet text in _real time_
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
				-- Show virtual text hints for node types
				ext_opts = {
					[types.insertNode] = {
						active = {
							virt_text = { { "●", "Operator" } },
						},
					},
					[types.choiceNode] = {
						active = {
							virt_text = { { "●", "Constant" } },
						},
					},
				},
			})

			-- GO back to the previous region
			vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
			-- Toggle between choices
			vim.keymap.set({ "i", "s" }, "<C-K>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
			-- Go forward to the next region
			vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })

			-- load vscode style snippets from other plugins
			require("luasnip.loaders.from_vscode").lazy_load()

			-- load my custom snippets
			ls.add_snippets("typescript", snippets.typescript)
			ls.add_snippets("go", snippets.go)
		end,
	},

}

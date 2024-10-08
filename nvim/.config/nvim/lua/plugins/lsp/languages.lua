local lsp = require('lsp-zero')
local lspconfig = require("lspconfig")

require('mason-lspconfig').setup {
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"vimls",
		"lemminx",
		"jsonls",
		"yamlls",
		"helm_ls",
		"jdtls",
		"gopls"
	},
	handlers = {
		lsp.default_setup
	}
}

-- LUA
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace"
			},
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})
-- LUA END

-- TSSERVER
lspconfig.ts_ls.setup({
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
			},
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = false,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = false,
			},
		},
	},
	commands = {
	}
})
-- TSSERVER END

-- GOLANG
lspconfig.gopls.setup({
	cmd = { "gopls" },
	settings = {
		-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md#completion
		gopls = {
			completeUnimported = true,
			experimentalPostfixCompletions = true,
			init_options = {
				usePlaceholders = true,
			},
			analyses = {
				unusedparams = true,
				shadow = true,
				unreachable = true
			},
			-- report vulnerabilities
			vulncheck = "Imports",
			staticcheck = true,
			gofumpt = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			}
		},
	},
})
-- GOLANG END

-- HELM/YAML START
lspconfig.helm_ls.setup {
	settings = {
		['helm-ls'] = {
			yamlls = {
				path = "yaml-language-server",
			}
		}
	}
}

lspconfig.yamlls.setup {}

-- HELM/YAML END

-- JAVA START
-- This may cause issues between different environments
-- // Remember guys :JdtWipeDataAndRestart is your friend
-- // ALso... rm -rf ~/.cache/jdtls
lspconfig.jdtls.setup({})
-- JAVA END

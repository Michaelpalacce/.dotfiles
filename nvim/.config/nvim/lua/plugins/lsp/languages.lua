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
		"gopls",
		"html",
	},
	handlers = {
		-- this first function is the "default handler"
		-- it applies to every language server without a "custom handler"
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
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
			usePlaceholders = false,
			analyses = {
				unusedparams = true,
				unusedvariables = true,
				useany = true,
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

-- JSON START
lspconfig.jsonls.setup {
	filetypes = { "json", "json5" }
}
-- JSON END

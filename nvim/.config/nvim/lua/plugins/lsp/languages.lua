require('mason-lspconfig').setup {
	ensure_installed = {
		"lua_ls",
		"vimls",
		-- "gopls",
		-- "ts_ls",
		-- "lemminx",
		-- "jsonls",
		-- "yamlls",
		-- "helm_ls",
		-- "jdtls",
		-- "html",
	},
	automatic_enable = true,
}

-- LUA
vim.lsp.config("lua_ls", {
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
local inlayHints = {
	includeInlayEnumMemberValueHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayFunctionParameterTypeHints = true,
	includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
	includeInlayParameterNameHintsWhenArgumentMatchesName = true,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayVariableTypeHints = false,
}

vim.lsp.config("ts_ls", {
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
			inlayHints = inlayHints,
		},
		javascript = {
			inlayHints = inlayHints,
		},
	},
	commands = {}
})
-- TSSERVER END

-- GOLANG
vim.lsp.config("gopls", {
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
vim.lsp.config("helm_ls", {
	settings = {
		['helm-ls'] = {
			yamlls = {
				path = "yaml-language-server",
			}
		}
	}
})

vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			schemaStore = {
				-- You must disable built-in schemaStore support if you want to use
				-- this plugin and its advanced options like `ignore`.
				enable = false,
				-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
				url = "",
			},
			schemas = require('schemastore').yaml.schemas(),
		},
	},
})
-- HELM/YAML END

-- JSON START
vim.lsp.config("jsonls", {
	filetypes = { "json", "json5" },
	settings = {
		json = {
			schemas = require('schemastore').json.schemas(),
			validate = { enable = true },
		},
	}
})
-- JSON END

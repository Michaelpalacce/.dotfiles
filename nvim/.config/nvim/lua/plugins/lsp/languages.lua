local lspconfig = require("lspconfig")

require('mason-lspconfig').setup {
	ensure_installed = {
		"lua_ls",
		"vimls",
		"gopls",
		-- "ts_ls",
		-- "lemminx",
		-- "jsonls",
		-- "yamlls",
		-- "helm_ls",
		-- "jdtls",
		-- "html",
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
local inlayHints = {
	includeInlayEnumMemberValueHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayFunctionParameterTypeHints = true,
	includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
	includeInlayParameterNameHintsWhenArgumentMatchesName = true,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayVariableTypeHints = false,
}

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
			inlayHints = inlayHints,
		},
		javascript = {
			inlayHints = inlayHints,
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

lspconfig.yamlls.setup {
	settings = {
		yaml = {
			schemaStore = {
				-- You must disable built-in schemaStore support if you want to use
				-- this plugin and its advanced options like `ignore`.
				enable = false,
				-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
				url = "",
			},
			schemas = require('schemastore').yaml.schemas {
				extra = {
					{
						description = "PIAC schema",
						fileMatch = "spec.yaml",
						name = "spec.yaml",
						url = "file://" .. vim.fn.expand("~/.config/schemas/json/piac_spec_yaml_json_schema.json"),
					},
				}
			},
		},
	},
}
-- HELM/YAML END

-- JAVA START
-- This may cause issues between different environments
-- // Remember guys :JdtWipeDataAndRestart is your friend
-- // ALso... rm -rf ~/.cache/jdtls
lspconfig.jdtls.setup({})
-- JAVA END

-- JSON START
lspconfig.jsonls.setup {
	filetypes = { "json", "json5" },
	settings = {
		json = {
			schemas = require('schemastore').json.schemas(),
			validate = { enable = true },
		},
	}
}
-- JSON END

local lsp = require('lsp-zero')
local lspconfig = require("lspconfig")

require('mason-lspconfig').setup {
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"vimls",
		"volar",
		"lemminx",
		"jsonls",
		"yamlls",
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

lspconfig.tsserver.setup({
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
	},
	commands = {
	}
})
-- TSSERVER END

-- VOLAR (VUE)
lspconfig.volar.setup {}
-- VUE END

-- GOLANG
lspconfig.gopls.setup({
	cmd = { "gopls" },
	settings = {
		-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md#completion
		gopls = {
			completeUnimported = true,
			-- This will add placeholders when a function is autocompleted... sucks cause you also get the type... and it's not an easy replace
			usePlaceholders = false,
			analyses = {
				unusedparams = true,
				unreachable = true
			},
			-- report vulnerabilities
			vulncheck = "Imports",
			staticcheck = true,
			gofumpt = true,
		},
	},
})
-- GOLANG END

-- JAVA START
-- This may cause issues between different environments
lspconfig.jdtls.setup({})
-- JAVA END

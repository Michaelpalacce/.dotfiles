local lsp = require('lsp-zero')
local lspconfig = require("lspconfig")

require('mason-lspconfig').setup {
	ensure_installed = {
		'tsserver',
		'eslint',
		'lua_ls',
		'jsonls',
		'yamlls',
		'vimls',
		'volar',
		'lemminx',
		'gopls'
	},
	handlers = {
		lsp.default_setup
	}
}

-- LUA
require("neodev").setup({
	-- add any options here, or leave empty to use the default settings
})

-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace"
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

-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#imports-and-formatting
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end
})

-- GOLANG END

-- JAVA START
-- This may cause issues between different environments
require('lspconfig').jdtls.setup({})
-- JAVA END

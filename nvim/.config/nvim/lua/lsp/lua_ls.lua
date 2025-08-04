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

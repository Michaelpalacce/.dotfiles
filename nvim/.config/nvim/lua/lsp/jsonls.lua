vim.lsp.config("jsonls", {
	filetypes = { "json", "json5" },
	settings = {
		json = {
			schemas = require('schemastore').json.schemas(),
			validate = { enable = true },
		},
	}
})

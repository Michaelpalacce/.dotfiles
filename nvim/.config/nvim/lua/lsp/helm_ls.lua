vim.lsp.config("helm_ls", {
	settings = {
		['helm-ls'] = {
			yamlls = {
				path = "yaml-language-server",
			}
		}
	}
})

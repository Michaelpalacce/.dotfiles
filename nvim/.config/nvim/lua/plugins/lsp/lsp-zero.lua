local lsp = require('lsp-zero')

-- I need to configure this shit on my own... I don't want the default mappings... stolen from: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#minimal
lsp.preset({
	float_border = 'rounded',
	call_servers = 'local',
	configure_diagnostics = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = false,
	manage_nvim_cmp = {
		set_sources = 'recommended',
		set_basic_mappings = true,
		set_extra_mappings = false,
		use_luasnip = true,
		set_format = true,
		documentation_window = true,
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set({ 'n', 'v' }, '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

	vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
	vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
	vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
end)


lsp.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

lsp.setup()

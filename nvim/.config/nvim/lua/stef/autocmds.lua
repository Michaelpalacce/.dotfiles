vim.api.nvim_create_autocmd('BufReadPost', {
	desc = 'Open file at the last position it was edited earlier',
	group = "Stef",
	pattern = '*',
	command = 'silent! normal! g`"zv'
})

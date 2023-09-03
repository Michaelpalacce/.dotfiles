local builtin = require('telescope.builtin')
-- Yes we depend on telescope boiiiiiiiiiiiiiiiiiii. Yes it is hidden

vim.keymap.set('n', "<leader>gs", vim.cmd.Git, { desc = '[T]oggle [G]it Status' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope: [G]it [B]ranches' })
vim.keymap.set('n', '<leader>gd', builtin.git_status, { desc = 'Telescope: [G]it [D]iff' })

local stef_Fugitive = vim.api.nvim_create_augroup("stef_Fugitive", {})
local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = stef_Fugitive,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()

		vim.keymap.set('n', "<leader>gp", function()
			vim.cmd.Git('push')
		end, { desc = "Fugitive: [G]it [P]ush", buffer = bufnr, remap = false })

		vim.keymap.set("n", "<leader>gP", function()
			vim.cmd.Git('pull')
		end, { buffer = bufnr, remap = false, desc = "Fugitive: [G]it [P]ull" })
	end,
})

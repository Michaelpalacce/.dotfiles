local builtin = require('telescope.builtin')
-- Yes we depend on telescope boiiiiiiiiiiiiiiiiiii. Yes it is hidden

vim.keymap.set('n', "<leader>gs", vim.cmd.Git, { desc = '[T]oggle [G]it Status' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope: [G]it [B]ranches' })
vim.keymap.set('n', '<leader>gd', builtin.git_status, { desc = 'Telescope: [G]it [D]iff' })

vim.keymap.set('n', "<leader>gp", function()
	vim.cmd.Git('push')
end, { desc = "Fugitive: [G]it [P]ush", remap = false })

vim.keymap.set("n", "<leader>gP", function()
	vim.cmd.Git('pull')
end, { remap = false, desc = "Fugitive: [G]it [P]ull" })

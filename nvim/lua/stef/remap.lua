vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>fe", vim.cmd.Ex) -- <SPACE> fe -- stands for file explore

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>", { desc = 'Remove recording feature' })

vim.keymap.set('n', "<C-d>", "VYp", { desc = 'Dupicate current line' })

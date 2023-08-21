vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>fe", vim.cmd.Ex) -- <SPACE> fe -- stands for file explore

------------------------------------------
-- Things I hate
------------------------------------------

-- disables
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>", { desc = 'Remove recording feature' })

------------------------------------------
-- Helpers
------------------------------------------

-- helpers
vim.keymap.set('n', "<C-U>", function ()
    vim.cmd.PackerSync()
    vim.cmd.TSUpdate()
    vim.cmd.MasonUpdate()
end, { desc = "Run TSUpdate, PackerSync, MasonUpdate" } )

------------------------------------------
-- General remaps
------------------------------------------

-- Remaps
vim.keymap.set('n', "<leader>y", "+y", { desc = 'Copy to system clipboard' })
vim.keymap.set('n', "<C-d>", "VYp", { desc = 'Dupicate current line' })
vim.keymap.set('n', "<C-H>", ":noh<CR><CR>", { desc = 'Hide search highlighting' })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Reload
vim.keymap.set("n", "<leader>r", ":e!<CR>", { desc = "Reload current file" })
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save current file" })

-- Move Lines
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-Down>', '<C-w>j')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-Right>', '<C-w>l')

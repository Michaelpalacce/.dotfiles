-- Things I hate
------------------------------------------
------------------------------------------

-- disables
vim.keymap.set("n", "Q", "<nop>") -- dunno what Q does anyway
-- vim.keymap.set("n", "q", "<nop>", { desc = 'Remove recording feature' })

------------------------------------------
-- Helpers
------------------------------------------

-- helpers
vim.keymap.set('n', "<leader>u", function()
	vim.cmd.TSUpdate()
	vim.cmd.MasonUpdate()
	vim.cmd.Lazy()
end, { desc = "R[u]n TSUpdate, MasonUpdate, Lazy" })

------------------------------------------
-- General remaps
------------------------------------------

-- TMUX
-- vim.keymap.set("n", "<leader>so", "<cmd>silent !tmux neww tmux-sessionizer 'nvim .'<CR>", { desc = "[S]cripts Tmux [S]essionizer With Nvim" })
vim.keymap.set("n", "<leader>sc", "<cmd>silent !tmux neww tmux-cht<CR>", { desc = "[S]cripts [C]heatsheet" })
vim.keymap.set("n", "<leader>sb", "<cmd>silent !tmux neww tmux-exxegutor<CR>", { desc = "[S]cripts [M]aven" })
vim.keymap.set("n", "<leader>si", "<cmd>silent !tmux neww tmux-identity-theft<CR>", { desc = "[S]cripts Switch [I]dentity" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

vim.keymap.set("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Move Between Windows
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-Down>', '<C-w>j')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-Right>', '<C-w>l')
vim.keymap.set('n', '<C-q>', '<C-w>q')

-- Quick Fix
vim.keymap.set("n", "<S-Down>", "<cmd>cnext<CR>zz", { desc = 'Go to the next quickfix item' })
vim.keymap.set("n", "<S-Up>", "<cmd>cprev<CR>zz", { desc = 'Go to the previous quickfix item' })
vim.keymap.set("n", "<S-Left>", "<cmd>copen<CR>zz", { desc = 'Open quickfix' })
vim.keymap.set("n", "<S-Right>", "<cmd>cclose<CR>zz", { desc = 'Close quickfix' })

-- Buffers
vim.keymap.set("n", "<leader>bD", "<cmd>%bd|e#<CR>", { desc = '[B]uffers [D]elete all but current' })

-- Moving
-- vim.api.nvim_set_keymap('n', '<C-g>', '<C-b>',
-- 	{ desc = "Move back (C-b) remapped cause of tmux", noremap = true, silent = true })

-- Files
vim.api.nvim_set_keymap("n", "QQ", ":qa!<CR>", { noremap = false, desc = "Quit without saving" })
vim.api.nvim_set_keymap("n", "WW", ":wa<CR>", { noremap = false, desc = "Write all" })
vim.api.nvim_set_keymap("n", "Ww", ":w<CR>", { noremap = false, desc = "Write current file" })
vim.api.nvim_set_keymap("n", "E", "$", { noremap = false })
vim.api.nvim_set_keymap("n", "B", "^", { noremap = false })

-- Things I hate
------------------------------------------
------------------------------------------

-- disables
-- vim.keymap.set("n", "Q", "<nop>")
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

-- QoL

vim.keymap.set("i", "<C-c>", "<Esc>")

-- TMUX

vim.keymap.set("n", "<leader>s", "<cmd>silent !tmux neww tmux-sessionizer 'nvim .'<CR>",
	{ desc = "TMUX sessionizer, NVIM" })
vim.keymap.set("n", "<leader>S", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "TMUX sessionizer, terminal" })

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

-- -- Reload
-- vim.keymap.set("n", "<leader>fr", ":e!<CR>", { desc = "[F]ile: [R]eload" })

-- Move Between Windows
-- vim.keymap.set('n', '<C-h>', '<C-w>h')
-- vim.keymap.set('n', '<C-j>', '<C-w>j')
-- vim.keymap.set('n', '<C-k>', '<C-w>k')
-- vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-Down>', '<C-w>j')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-Right>', '<C-w>l')
vim.keymap.set('n', '<C-q>', '<C-w>q')

-- Quick Fix
vim.keymap.set("n", "<S-Down>", "<cmd>cnext<CR>zz", { desc = 'Go to the next quickfix item' })
vim.keymap.set("n", "<S-Up>", "<cmd>cprev<CR>zz", { desc = 'Go to the previous quickfix item' })

-- Stop inserting and move cursor, re-enter insert
vim.keymap.set({ "n", "i", "v" }, '<C-h>', '<Left>', { desc = "Move cursor left while editing" })
vim.keymap.set({ "n", "i", "v" }, '<C-l>', '<Right>', { desc = "Move cursor right while editing" })
vim.keymap.set({ "n", "i", "v" }, '<C-j>', '<Down>', { desc = "Move cursor down while editing" })
vim.keymap.set({ "n", "i", "v" }, '<C-k>', '<Up>', { desc = "Move cursor up while editing" })

-- Buffers
vim.keymap.set("n", "<leader>bD", "<cmd>%bd|e#<CR>", { desc = '[B]uffers [D]elete all but current' })

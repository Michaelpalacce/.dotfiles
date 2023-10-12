vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>fe", vim.cmd.Ex) -- <SPACE> fe -- stands for file explore

------------------------------------------
-- Things I hate
------------------------------------------

-- disables
vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "q", "<nop>", { desc = 'Remove recording feature' })

------------------------------------------
-- Helpers
------------------------------------------

-- helpers
vim.keymap.set('n', "<leader>u", function()
	vim.cmd.PackerSync()
	vim.cmd.TSUpdate()
	vim.cmd.MasonUpdate()
end, { desc = "R[u]n TSUpdate, PackerSync, MasonUpdate" })

------------------------------------------
-- General remaps
------------------------------------------

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
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-Down>', '<C-w>j')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-Right>', '<C-w>l')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-q>', '<C-w>q')

-- Config
vim.keymap.set("n", "<leader>cdd", ":cd ~/.dotfiles/<CR>", { desc = "[C]hange [D]irectory To [D]otfiles" });

-- Executables
vim.keymap.set("n", "<leader>cfe", ":!%:p<CR>", { desc = "[C]urrent [F]ile [E]xecute", silent = true });
vim.keymap.set("n", "<leader>cfx", "<cmd>!chmod +x %<CR>", { desc = "[C]urrent [F]ile Make E[x]ecutable", silent = true });
vim.keymap.set("n", "<leader>cfs", ":so<CR>", { desc = "[C]urrent [F]ile [S]hout out" });

-- Quick Fix
vim.keymap.set("n", "<S-Down>", "<cmd>cnext<CR>zz", { desc = 'Go to the next quickfix item' })
vim.keymap.set("n", "<S-Up>", "<cmd>cprev<CR>zz", { desc = 'Go to the previous quickfix item' })
vim.keymap.set("n", "<S-k>", "<cmd>cnext<CR>zz", { desc = 'Go to the next quickfix item' })
vim.keymap.set("n", "<S-j>", "<cmd>cprev<CR>zz", { desc = 'Go to the previous quickfix item' })

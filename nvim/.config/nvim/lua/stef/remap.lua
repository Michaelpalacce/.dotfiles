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
vim.keymap.set("n", "<leader>st", "<cmd>silent !tmux neww tmux-timer<CR>", { desc = "[S]cripts [T]imer" })
vim.keymap.set("n", "<leader>sc", "<cmd>silent !tmux neww tmux-cht<CR>", { desc = "[S]cripts [C]heatsheet" })
vim.keymap.set("n", "<leader>sb", "<cmd>silent !tmux neww tmux-exxegutor<CR>", { desc = "[S]cripts [B]uild" })
vim.keymap.set("n", "<leader>si", "<cmd>silent !tmux neww tmux-identity-theft<CR>",
	{ desc = "[S]cripts Switch [I]dentity" })
vim.keymap.set("n", "<leader>ss", "<cmd>silent !tmux neww tmux-sshuttle-daddy<CR>",
	{ desc = "[S]cripts Select [S]shuttle Server To Connect To" })
vim.keymap.set("n", "<leader>sw", "<cmd>silent !tmux neww tmux-wttr<CR>", { desc = "[S]cripts Get [W]eather Info" })
--
vim.keymap.set("v", ">", ">gv", { remap = true, desc = "Indent right" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })


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

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-q>', '<C-w>q')

-- Move in Insert Mode
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = false })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = false })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = false })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = false })

-- Quick Fix
vim.keymap.set("n", "<S-Down>", "<cmd>cnext<CR>zz", { desc = 'Go to the next quickfix item' })
vim.keymap.set("n", "<S-Up>", "<cmd>cprev<CR>zz", { desc = 'Go to the previous quickfix item' })
vim.keymap.set("n", "<S-Left>", "<cmd>copen<CR>zz", { desc = 'Open quickfix' })
vim.keymap.set("n", "<S-Right>", "<cmd>cclose<CR>zz", { desc = 'Close quickfix' })

-- Files
vim.keymap.set("n", "Qa", ":qa<CR>", { noremap = false, desc = "Quit all" })
vim.keymap.set("n", "Wq", ":wq<CR>", { noremap = false, desc = "Write current file and exit" })
vim.keymap.set("n", "Wa", ":wa<CR>", { noremap = false, desc = "Write all" })
vim.keymap.set("n", "Ww", ":w<CR>", { noremap = false, desc = "Write current file" })
vim.keymap.set({ "n", "v" }, "E", "$", { noremap = false })
vim.keymap.set({ "n", "v" }, "B", "^", { noremap = false })

-- SOPS
local sopsAgeKey = "age1mq6usjzvvxvcp7tl03yjdqd0kgjhhvhz48kmg86p43nhx0jc75jssw0kfn"
vim.keymap.set("n", "<leader>esd", function()
	vim.cmd(
		"!sops --age "
		.. sopsAgeKey
		.. " --decrypt --encrypted-regex '^(data|stringData|annotations|host)$' --in-place "
		.. vim.fn.expand('%')
	)
end, { noremap = true, desc = "[E]xecute: [S]ops [D]ecrypt", silent = true })

vim.keymap.set("n", "<leader>ese", function()
	vim.cmd(
		"!sops --age "
		.. sopsAgeKey
		.. " --encrypt --encrypted-regex '^(data|stringData|annotations|host)$' --in-place "
		.. vim.fn.expand('%')
	)
end, { noremap = true, desc = "[E]xecute: [S]ops [E]ncrypt", silent = true })

-- Base64 encode/decode

vim.api.nvim_set_keymap('v', '<leader>bd', 'c<c-r>=system(\'base64 --decode\', @")<cr><esc>',
	{ noremap = true, desc = "[B]ase64 [D]ecode" })

-- Only issue is it adds a newline at the end...
vim.api.nvim_set_keymap('v', '<leader>be', 'c<c-r>=system(\'base64\', @")<esc>',
	{ noremap = true, desc = "[B]ase64 [E]ncode" })

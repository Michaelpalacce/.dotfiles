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

-- No highlight
vim.keymap.set("n", "H", "<cmd>noh<CR>", { desc = "Clear [H]ighlights" })

-- TMUX
vim.keymap.set("n", "<leader>st", "<cmd>silent !tmux neww tmux-timer<CR>", { desc = "[S]cripts [T]imer" })
vim.keymap.set("n", "<leader>sc", "<cmd>silent !tmux neww tmux-cht<CR>", { desc = "[S]cripts [C]heatsheet" })
vim.keymap.set("n", "<leader>si", "<cmd>silent !tmux neww tmux-identity-theft<CR>",
	{ desc = "[S]cripts Switch [I]dentity" })
vim.keymap.set("n", "<leader>ss", "<cmd>silent !tmux neww tmux-sshuttle-daddy<CR>",
	{ desc = "[S]cripts Select [S]shuttle Server To Connect To" })
vim.keymap.set("n", "<leader>sw", "<cmd>silent !tmux neww tmux-wttr<CR>", { desc = "[S]cripts Get [W]eather Info" })

-- Easy indent
vim.keymap.set("v", ">", ">gv", { remap = true, desc = "Indent right" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })


-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- vim.keymap.set("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- vim.keymap.set("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- vim.keymap.set("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- vim.keymap.set("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- vim.keymap.set("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- vim.keymap.set("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

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

-- Quick Fix
vim.keymap.set("n", "<S-Down>", "<cmd>cnext<CR>zz", { desc = 'Go to the next quickfix item' })
vim.keymap.set("n", "<S-Up>", "<cmd>cprev<CR>zz", { desc = 'Go to the previous quickfix item' })
vim.keymap.set("n", "<S-Left>", "<cmd>copen<CR>zz", { desc = 'Open quickfix' })
vim.keymap.set("n", "<S-Right>", "<cmd>cclose<CR>zz", { desc = 'Close quickfix' })

-- Files
vim.keymap.set("n", "Qa", ":silent qa!<CR>", { noremap = false, desc = "Quit all", silent = true })
vim.keymap.set("n", "Wq", ":wq<CR>", { noremap = false, desc = "Write current file and exit", silent = true })
vim.keymap.set("n", "Wa", ":silent wa<CR>", { noremap = false, desc = "Write all", silent = true })
vim.keymap.set("n", "Ww", ":w<CR>", { noremap = false, desc = "Write current file", silent = true })
vim.keymap.set({ "n", "v" }, "E", "$", { noremap = false })
vim.keymap.set({ "n", "v" }, "B", "^", { noremap = false })
vim.keymap.set("n", "<leader>ce", ":!chmod +x %<CR>", { noremap = false, silent = true })


-- Windows
vim.keymap.set('n', '<C-w>O', '<C-w>o:DelBuffers<CR><CR>',
	{ noremap = true, desc = "Close other windows and delete buffers.", silent = true })

-- Inlay Hints
vim.keymap.set("n", '<leader>ti',
	function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
	end, { noremap = true, desc = "[T]oggle [I]nlay Hints", silent = true }
)

-- SOPS
local sopsAgeKey = "age1mq6usjzvvxvcp7tl03yjdqd0kgjhhvhz48kmg86p43nhx0jc75jssw0kfn"
vim.keymap.set("n", "<leader>esda", function()
	vim.cmd(
		"!sops --age "
		.. sopsAgeKey
		.. " --decrypt --ignore-mac --in-place "
		.. vim.fn.expand('%')
	)
end, { noremap = true, desc = "[E]xecute: [S]ops [D]ecrypt [A]ll", silent = true })

vim.keymap.set("n", "<leader>eses", function()
	vim.cmd(
		"!sops --age "
		.. sopsAgeKey
		.. " --encrypt --encrypted-regex '^(data|stringData|annotations|)$' --in-place "
		.. vim.fn.expand('%')
	)
end, { noremap = true, desc = "[E]xecute: [S]ops [E]ncrypt [S]ecret", silent = true })

vim.keymap.set("n", "<leader>eseS", function()
	vim.cmd(
		"!sops --age "
		.. sopsAgeKey
		.. " --encrypt --encrypted-regex '(?i)password|webhook_url|token|key' --in-place "
		.. vim.fn.expand('%')
	)
end, { noremap = true, desc = "[E]xecute: [S]ops [E]ncrypt [S]ensitive", silent = true })

vim.keymap.set("n", "<leader>esei", function()
	vim.cmd(
		"!sops --age "
		.. sopsAgeKey
		.. " --encrypt --encrypted-regex '^(rules|annotations|)$' --in-place "
		.. vim.fn.expand('%')
	)
end, { noremap = true, desc = "[E]xecute: [S]ops [E]ncrypt [I]ngress", silent = true })

vim.keymap.set("n", "<leader>esec", function()
	vim.cmd(
		"!sops --age "
		.. sopsAgeKey
		.. " --encrypt --encrypted-regex '^(data|stringData|annotations|)$' --in-place "
		.. vim.fn.expand('%')
	)
end, { noremap = true, desc = "[E]xecute: [S]ops [E]ncrypt [C]onfig", silent = true })

vim.keymap.set("n", "<leader>eseh", function()
	vim.cmd(
		"!sops --age "
		.. sopsAgeKey
		.. " --encrypt --encrypted-regex '^(values)$' --in-place "
		.. vim.fn.expand('%')
	)
end, { noremap = true, desc = "[E]xecute: [S]ops [E]ncrypt [H]elm Release", silent = true })

vim.keymap.set("n", "<leader>esee", function()
	vim.cmd(
		"!sops --age "
		.. sopsAgeKey
		.. " --encrypt --encrypted-regex '^(values)$' --in-place "
		.. vim.fn.expand('%')
	)
end, { noremap = true, desc = "[E]xecute: [S]ops [E]ncrypt [E]nvironment", silent = true })

vim.keymap.set("n", "<leader>eseA", function()
	vim.cmd(
		"!sops --age "
		.. sopsAgeKey
		.. " --encrypt --encrypted-regex '^(receivers)$' --in-place "
		.. vim.fn.expand('%')
	)
end, { noremap = true, desc = "[E]xecute: [S]ops [E]ncrypt [A]lert", silent = true })

vim.keymap.set("n", "<leader>esea", function()
	vim.cmd(
		"!sops --age "
		.. sopsAgeKey
		.. " --encrypt --encrypted-regex '.*' --in-place "
		.. vim.fn.expand('%')
	)
end, { noremap = true, desc = "[E]xecute: [S]ops [E]ncrypt [A]ll", silent = true })

-- Base64 encode/decode

vim.api.nvim_set_keymap('v', '<leader>bd', 'c<c-r>=system(\'base64 --decode\', @")<cr><esc>',
	{ noremap = true, desc = "[B]ase64 [D]ecode" })

-- Only issue is it adds a newline at the end...
vim.api.nvim_set_keymap('v', '<leader>be', 'c<c-r>=system(\'base64\', @")<esc>',
	{ noremap = true, desc = "[B]ase64 [E]ncode" })

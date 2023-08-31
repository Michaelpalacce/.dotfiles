require('lspsaga').setup({
	definition = {
		width = 0.9
	},
	rename = {
		auto_save = true,
		keys = {
			quit = '<Esc>'
		}
	},
	code_action = {
		show_server_name = true,
		extend_gitsigns = true,
		keys = {
			quit = '<Esc>'
		}
	}
})

vim.keymap.set({ 'n', 'v' }, '<leader>lo', '<cmd>Lspsaga outline<CR>', { desc = 'Open LSP Saga Outline' })
vim.keymap.set('n', '<F2>', '<cmd>Lspsaga rename<CR>', { desc = 'Rename struct under cursor' })
vim.keymap.set('n', '<F4>', '<cmd>Lspsaga code_action<CR>', { desc = 'Trigger code actions' })

local test = "";


test = '123132'

-- TODO: STILL NEEDS WORK
-- https://nvimdev.github.io/lspsaga/diagnostic/

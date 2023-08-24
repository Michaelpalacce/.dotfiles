require('lspsaga').setup({
    definition = {
        width = 0.9
    }
})

vim.keymap.set({ 'n', 'v' }, '<leader>lo', '<cmd>Lspsaga outline<CR>', { desc = 'Open LSP Saga Outline' })
vim.keymap.set('n', '<F2>', '<cmd>Lspsaga rename<CR>', { desc = 'Rename struct under cursor' })
vim.keymap.set('n', '<c-space>', '<cmd>Lspsaga code_action<CR>', { desc= 'Trigger code actions' })
vim.keymap.set('n', '<leader>lp', '<cmd>Lspsaga peek_definition<CR>', { desc= 'Peek the definition of the struct under cursor' })

-- TODO: STILL NEEDS WORK
-- https://nvimdev.github.io/lspsaga/diagnostic/

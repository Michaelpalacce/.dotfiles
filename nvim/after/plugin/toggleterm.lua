vim.keymap.set('n', '<leader>tn', vim.cmd.ToggleTerm, { desc = "Toggle Terminal" })

require("toggleterm").setup {
    direction = 'float'
    -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
}

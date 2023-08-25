vim.keymap.set('n', '<leader>tn', vim.cmd.ToggleTerm, { desc = "[T]oggle Termi[n]al" })

require("toggleterm").setup {
    direction = 'horizontal'
    -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: [Find] [F]iles' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope: [F]ind word in Project [Scope] (live grep)' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: [F]ind in [B]uffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: [F]ind [H]elp Tags' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope: [F]ind [G]it files' })

require('telescope').setup {
    defaults = {
        path_display = { 'truncate' },
        dynamic_preview_title = true,
        results_title = 'Your Results Milord'
    }
}

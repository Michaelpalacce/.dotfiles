vim.keymap.set('n', '<leader>ts', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "[T]oggle [S]pectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "[S]earch for current [w]ord"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "[S]earch for current [w]ord"
})
vim.keymap.set('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "[S]earch for current word in current [f]ile"
})

require('spectre').setup()

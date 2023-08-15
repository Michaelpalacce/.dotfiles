local mark = require("harpoon.mark")
local ui = require("harpoon.ui")



vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add File To Harpoon" })
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Show Harpoon Menu" })
vim.keymap.set("n", "<leader>1", function() ui.nav_prev() end)
vim.keymap.set("n", "<leader>2", function() ui.nav_next() end)




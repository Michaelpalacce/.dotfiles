local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add File To Harpoon" })
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Show Harpoon Menu" })
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon: 1" })
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon: 2" })
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon: 3" })
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon: 4" })
vim.keymap.set("n", "<leader>p", function() ui.nav_prev() end, { desc = "Harpoon: Go To Next" })
vim.keymap.set("n", "<leader>n", function() ui.nav_next() end, { desc = "Harpoon: Go To Previous" })



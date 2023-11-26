return {
	{
		'ThePrimeagen/harpoon', -- Allows for easier jumping between files
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[A]dd File To Harpoon" })
			vim.keymap.set("n", "<leader>th", ui.toggle_quick_menu, { desc = "[T]oggle [H]arpoon" })
			vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon: 1" })
			vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon: 2" })
			vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon: 3" })
			vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon: 4" })
			vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = "Harpoon: 5" })
			vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end, { desc = "Harpoon: 6" })
			vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end, { desc = "Harpoon: 7" })
			vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end, { desc = "Harpoon: 8" })
			vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end, { desc = "Harpoon: 9" })
			vim.keymap.set("n", "<leader>0", function() ui.nav_file(0) end, { desc = "Harpoon: 0" })
		end
	},
}

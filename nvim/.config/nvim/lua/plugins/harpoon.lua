return {
	{
		'ThePrimeagen/harpoon', -- Allows for easier jumping between files
		branch = 'harpoon2',
		depedencies = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup()
			-- REQUIRED

			vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "[A]dds file to harpoon" })
			vim.keymap.set("n", "<leader>th", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
				{ desc = "[T]oggles [H]arpoon menu" })

			vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end,
				{ desc = "[1] Select 1st harpoon item" })
			vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end,
				{ desc = "[2] Select 2nd harpoon item" })
			vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end,
				{ desc = "[3] Select 3rd harpoon item" })
			vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end,
				{ desc = "[4] Select 4th harpoon item" })
		end

	},
}

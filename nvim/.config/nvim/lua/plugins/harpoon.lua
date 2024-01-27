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

			vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Harpoon: [A]dds file to harpoon" })
			vim.keymap.set("n", "<leader>th", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
				{ desc = "Harpoon: [T]oggles [H]arpoon menu" })

			vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end,
				{ desc = "Harpoon: [1] Select 1st harpoon item" })
			vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end,
				{ desc = "Harpoon: [2] Select 2nd harpoon item" })
			vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end,
				{ desc = "Harpoon: [3] Select 3rd harpoon item" })
			vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end,
				{ desc = "Harpoon: [4] Select 4th harpoon item" })
			vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end,
				{ desc = "Harpoon: [5] Select 5th harpoon item" })
			vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end,
				{ desc = "Harpoon: [6] Select 6th harpoon item" })
			vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end,
				{ desc = "Harpoon: [7] Select 7th harpoon item" })
		end

	},
}

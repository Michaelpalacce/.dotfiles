return {
	{
		'ThePrimeagen/harpoon', -- Allows for easier jumping between files
		branch = 'harpoon2',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		keys = {
			{ "<leader>a",  mode = { "n" }, function() require("harpoon"):list():add() end,                                    desc = "Harpoon: [A]dds file to harpoon",      noremap = false },
			{ "<leader>th", mode = { "n" }, function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon: [T]oggles [H]arpoon menu",    noremap = false },
			{ "<leader>1",  mode = { "n" }, function() require("harpoon"):list():select(1) end,                                "desc = Harpoon: [1] Select 1st harpoon item", noremap = false },
			{ "<leader>2",  mode = { "n" }, function() require("harpoon"):list():select(2) end,                                "desc = Harpoon: [2] Select 1st harpoon item", noremap = false },
			{ "<leader>3",  mode = { "n" }, function() require("harpoon"):list():select(3) end,                                "desc = Harpoon: [3] Select 1st harpoon item", noremap = false },
			{ "<leader>4",  mode = { "n" }, function() require("harpoon"):list():select(4) end,                                "desc = Harpoon: [4] Select 1st harpoon item", noremap = false },
			{ "<leader>5",  mode = { "n" }, function() require("harpoon"):list():select(5) end,                                "desc = Harpoon: [5] Select 1st harpoon item", noremap = false },
			{ "<leader>6",  mode = { "n" }, function() require("harpoon"):list():select(6) end,                                "desc = Harpoon: [6] Select 1st harpoon item", noremap = false },
			{ "<leader>7",  mode = { "n" }, function() require("harpoon"):list():select(7) end,                                "desc = Harpoon: [7] Select 1st harpoon item", noremap = false },
		},
		opts = {},
	},
}

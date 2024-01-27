return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		mode = "exact",
		uppercase = "",
		modes = {
			search = {
				enabled = false
			}
		}
	},
	keys = {
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
		{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
		{ "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search (After you've triggered Flash Treesitter)" },
		{ "r", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search (After you've triggered Flash Treesitter)" },
	},
}

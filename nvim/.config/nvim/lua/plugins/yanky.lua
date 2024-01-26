return {
	{
		-- Yanky - Yank History
		"gbprod/yanky.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		event = "BufRead",
		config = function()
			require("telescope").load_extension("yank_history")
			vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
			vim.keymap.set({ "n", "x" }, "P", ":Telescope yank_history<CR>", { desc = '[T]oggle [Y]ank History' })

			require("yanky").setup {
				highlight = {
					timer = 150,
				}
			}
		end
	}
}

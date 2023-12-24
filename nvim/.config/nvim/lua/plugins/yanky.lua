return {
	{
		-- Yanky - Yank History
		-- Toggle with C-n and C-p
		"gbprod/yanky.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
			vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
			vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
			vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

			require("telescope").load_extension("yank_history")
			vim.keymap.set('n', "<leader>fy", ":Telescope yank_history<CR>", { desc = '[T]oggle [Y]ank History' })

			require("yanky").setup {
				highlight = {
					timer = 150,
				}
			}
		end
	}
}

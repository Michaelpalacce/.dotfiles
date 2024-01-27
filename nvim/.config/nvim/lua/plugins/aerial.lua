return {
	{
		'stevearc/aerial.nvim', -- Displays a nice outline of the file
		event = "LspAttach",
		config = function()
			vim.keymap.set("n", "<leader>ta", "<cmd>AerialToggle!<CR>", { desc = "Aerial: [T]oggle [A]erial" })

			require("aerial").setup({
				-- optionally use on_attach to set keymaps when aerial has attached to a buffer
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set({ "n", "v" }, "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Aerial: Previous Function" })
					vim.keymap.set({ "n", "v" }, "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Aerial: Next Function" })
				end,
			})
		end,
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
	}
}

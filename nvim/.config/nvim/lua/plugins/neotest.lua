return {
	-- Testing
	{
		"nvim-neotest/neotest",
		dependencies = {
			'vim-test/vim-test',
			'nvim-neotest/neotest-vim-test',
			'nvim-neotest/nvim-nio',
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-go",
			"nvim-contrib/nvim-ginkgo",
		},
		-- Limit to go, cause that's all I use it for
		ft = { "go", "gomod" },
		config = function()
			-- get neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)

			vim.keymap.set("n", "<leader>Tr", "<cmd>lua require'neotest'.run.run()<CR>",
				{ silent = true, desc = "Neotest: [R]un nearest" })

			vim.keymap.set("n", "<leader>Tf", "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<CR>",
				{ silent = true, desc = "Neotest: Run [F]ile" })

			vim.keymap.set("n", "<leader>Ts", "<cmd>lua require'neotest'.summary.toggle()<CR>",
				{ silent = true, desc = "Neotest: Toggle [S]ummary" })

			vim.keymap.set("n", "<leader>To", "<cmd>lua require('neotest').output.open({ enter = true })<CR>",
				{ silent = true, desc = "Neotest: Toggle [O]utput" })

			vim.keymap.set('n', '[n', '<cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>',
				{ noremap = true, silent = true, desc = "Neotest: Jump to [N]ext failed" })
			vim.keymap.set('n', ']n', '<cmd>lua require("neotest").jump.next({ status = "failed" })<CR>',
				{ noremap = true, silent = true, desc = "Neotest: Jump to [N]ext failed" })

			require("neotest").setup({
				adapters = {
					require("neotest-go"),
					require("neotest-vim-test")({ ignore_filetypes = { "go", "golang" } }),
					require("nvim-ginkgo")
				},
			})
		end
	},
}

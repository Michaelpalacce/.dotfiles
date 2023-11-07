return {
	{
		"folke/trouble.nvim", -- Workspace Diagnostics
		event = "LspAttach",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.keymap.set("n", "<leader>do", function() require("trouble").open() end, { desc = "Open Trouble" })
			vim.keymap.set("n", "<leader>dw", function() require("trouble").open("workspace_diagnostics") end,
				{ desc = 'Trouble: [W]orkspace Diagnostics' })
			vim.keymap.set("n", "<leader>dd", function() require("trouble").open("document_diagnostics") end,
				{ desc = 'Trouble: [D]ocument Diagnostics' })
			vim.keymap.set("n", "<leader>dq", function() require("trouble").open("quickfix") end,
				{ desc = 'Trouble: [Q]uickfix' })
			vim.keymap.set("n", "<leader>dl", function() require("trouble").open("loclist") end,
				{ desc = 'Trouble: [L]ocallist' })
			vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end,
				{ desc = 'Trouble: [G]o To LSP [R]eferences' })
		end
	}, }

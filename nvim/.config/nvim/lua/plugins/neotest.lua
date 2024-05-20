return {
	-- Testing
	{
		"nvim-neotest/neotest",
		dependencies = {
			'vim-test/vim-test',
			'nvim-neotest/neotest-vim-test',
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-go",
		},
		-- Limit to go, cause that's all I use it for
		ft = { "go", "gomod" },
		config = function()
			-- ##########################################################
			-- Testing
			-- ##########################################################

			require "plugins.lsp.testing"
		end
	},
}

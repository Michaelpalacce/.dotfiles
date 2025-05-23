return {
	-- Debugging capabilities
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'nvim-neotest/nvim-nio',
			'rcarriga/nvim-dap-ui',
			'leoluz/nvim-dap-go',
			'jay-babu/mason-nvim-dap.nvim',
			'theHamsta/nvim-dap-virtual-text'
		},
		-- Limit to go, cause that's all I use it for
		ft = { "go", "gomod" },
		config = function()
			-- ##########################################################
			-- Debugging
			-- ##########################################################

			require "plugins.lsp.debugging" -- Contains all the debugging configs
		end
	},
}

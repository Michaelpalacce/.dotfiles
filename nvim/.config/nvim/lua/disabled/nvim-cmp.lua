return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' },

			-- Icons
		},
		event = 'InsertEnter',
		config = function()
			-- ##########################################################
			-- Completion
			-- ##########################################################

			require "plugins.lsp.cmp" -- Contains all the completion configs
		end
	},
}

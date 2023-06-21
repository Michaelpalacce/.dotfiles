return require('packer').startup(function(use)
  -- Configurations will go here soon
	use 'wbthomason/packer.nvim'
        use 'williamboman/mason.nvim'   
        use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use({ 'shaunsingh/nord.nvim', as = 'nord' })
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
end)

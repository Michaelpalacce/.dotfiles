return require('packer').startup(function(use)
  -- Configurations will go here soon
	use 'wbthomason/packer.nvim'
        use 'williamboman/mason.nvim'   
        use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use({ 'shaunsingh/nord.nvim', as = 'nord' })
	use({ 'Mofiqul/dracula.nvim', as = 'dracula' })
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('ThePrimeagen/vim-be-good')
end)

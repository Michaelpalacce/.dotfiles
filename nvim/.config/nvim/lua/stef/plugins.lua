local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Dependencies: ripgrep, sed,
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Packer is the plugin manager
	use 'nvim-lua/plenary.nvim' -- Set of tools for lua

	-- ##################################################
	-- ########## LSP Stuff
	-- ##################################################

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' },
			{ 'petertriho/cmp-git' }
		}
	}



	use { 'j-hui/fidget.nvim', tag = 'legacy' }                             -- Shows a spinner of lsp loading
	use { "folke/trouble.nvim", requires = { "nvim-tree/nvim-web-devicons" } } -- Workspace Diagnostics

	-- ##################################################
	-- ########## Languages
	-- ##################################################

	-- General

	-- ##################################################
	-- ########## Themeing
	-- ##################################################

	use { 'Mofiqul/dracula.nvim', as = 'dracula' } -- Theme
	use { "catppuccin/nvim", as = "catppuccin" } -- Theme
	use { 'doums/darcula', as = 'darcula' }     -- Theme

	use 'nvim-tree/nvim-web-devicons'           -- Does some magic so we can have icons.
	use 'nvim-lualine/lualine.nvim'             -- Provides a nice status bar at the bottom of the screen

	-- ##################################################
	-- ########## Navigation
	-- ##################################################

	use { 'nvim-telescope/telescope.nvim', tag = '0.1.x' }     -- Provides nice file jumping Capabilities
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }) -- Provides syntax highlighting
	use 'ThePrimeagen/harpoon'                                 -- Allows for easier jumping between files
	use 'nvim-tree/nvim-tree.lua'                              -- Shows a nice file tree

	use({
		'ggandor/leap.nvim', -- Easily go to text
		dependencies = { 'tpope/vim-repeat' },
	})

	-- ##################################################
	-- ########## Tutorials
	-- ##################################################

	use 'folke/which-key.nvim' -- Show tooltips what key combinations you can do
	use {
		'sudormrfbin/cheatsheet.nvim',
		requires = {
			{ 'nvim-telescope/telescope.nvim' },
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' },
		}
	}

	-- ##################################################
	-- ########## Editor
	-- ##################################################

	use 'tpope/vim-surround'                   -- Magic text surround replacement https://github.com/tpope/vim-surround
	use 'nvim-treesitter/nvim-treesitter-context' -- Provides a nice context of where you are
	use 'mbbill/undotree'                      -- Nice undo visualization
	use { "akinsho/toggleterm.nvim", tag = '*' } -- Nice terminal
	use 'numToStr/Comment.nvim'                -- Easy Commenting
	use 'RRethy/vim-illuminate'                -- illuminates similar vars
	use 'windwp/nvim-autopairs'                -- Autopairs

	-- ##################################################
	-- ########## Git
	-- ##################################################

	use 'tpope/vim-fugitive'   -- Git operations
	use 'lewis6991/gitsigns.nvim' -- Show Signs in the gutter

	-- ##################################################
	-- ########## Helpers
	-- ##################################################

	use 'dstein64/vim-startuptime' -- Measures startuptime :StartupTime

	-- ##################################################
	-- ########## Finalize
	-- ##################################################

	if packer_bootstrap then
		require('packer').sync()
	end
end)

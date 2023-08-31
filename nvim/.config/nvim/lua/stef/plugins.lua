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

-- Dependencies: ripgrep

return require('packer').startup(function(use)
	-- ########## Configurations will go here soon

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
			{ 'petertriho/cmp-git' }
		}
	}

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
		requires = {
			{ 'rafamadriz/friendly-snippets' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'tamago324/nlsp-settings.nvim' }
		}
	})

	use {
		'j-hui/fidget.nvim', -- Shows a progress bar for LSP stuff
		tag = 'legacy',
	}

	use({
		'nvimdev/lspsaga.nvim', -- Improved LSP functionality
		after = 'nvim-lspconfig',
	})

	use {
		"folke/trouble.nvim", -- Workspace Diagnostics
		requires = { "nvim-tree/nvim-web-devicons" },
	}

	-- ##################################################
	-- ########## Languages
	-- ##################################################

	-- ##################################################
	-- ########## Themeing
	-- ##################################################

	use { 'shaunsingh/nord.nvim', as = 'nord' } -- Theme
	use { 'Mofiqul/dracula.nvim', as = 'dracula' } -- Theme
	use { "catppuccin/nvim", as = "catppuccin" } -- Theme
	use { 'rose-pine/neovim', as = 'rose-pine' } -- Theme
	use { 'doums/darcula', as = 'darcula' }     -- Theme
	use 'Mofiqul/vscode.nvim'                   -- Theme
	use 'AlexvZyl/nordic.nvim'                  -- Theme

	use 'nvim-tree/nvim-web-devicons'           -- Does some magic so we can have icons.
	use {
		'nvim-lualine/lualine.nvim',            -- Provides a nice status bar at the bottom of the screen
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
	}

	-- ########## Navigation
	-- ##################################################

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2', -- Provides nice file jumping Capabilities
		-- ##################################################
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }) -- Provides syntax highlighting
	use 'ThePrimeagen/harpoon'                                 -- Allows for easier jumping between files
	use {
		'nvim-tree/nvim-tree.lua',                             -- Shows a nice file tree
		requires = { 'nvim-tree/nvim-web-devicons' },
	}

	use({
		'ggandor/leap.nvim', -- Easily go to text
		dependencies = { 'tpope/vim-repeat' },
	})

	-- ##################################################
	-- ########## Tutorials
	-- ##################################################

	use 'ThePrimeagen/vim-be-good' -- Learn how to be better at vim
	use 'folke/which-key.nvim'  -- Show tooltips what key combinations you can do
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

	use 'andythigpen/nvim-coverage'            -- Displays code coverage in the gutter
	use 'nvim-treesitter/nvim-treesitter-context' -- Provides a nice context of where you are
	use 'mbbill/undotree'                      -- Nice undo visualization
	use 'jiangmiao/auto-pairs'                 -- Automatically pair up closing brackets and other symbols
	use { "akinsho/toggleterm.nvim", tag = '*' } -- Nice terminal
	use 'romgrk/barbar.nvim'                   -- Tabs
	use 'numToStr/Comment.nvim'                -- Easy Commenting
	use 'RRethy/vim-illuminate'                -- illuminates similar vars
	use 'nvim-pack/nvim-spectre'               -- Global Search and replace
	use 'dstein64/vim-startuptime'             -- Measures startuptime
	use 'kevinhwang91/nvim-bqf'                -- Better Quickfix

	use 'ray-x/lsp_signature.nvim'

	use { 'junegunn/fzf', run = function()
		vim.fn['fzf#install']()
	end }

	-- ##################################################
	-- ########## Git
	-- ##################################################

	use 'airblade/vim-gitgutter' -- Shows if a line has been added/modified/etc
	use 'tpope/vim-fugitive'  -- Git operations

	if packer_bootstrap then
		require('packer').sync()
	end
end)

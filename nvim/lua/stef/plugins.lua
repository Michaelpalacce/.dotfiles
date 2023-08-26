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
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

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

    -- Typescript

    use('dmmulroy/tsc.nvim')


    -- ##################################################
    -- ########## Themeing
    -- ##################################################
    use { 'shaunsingh/nord.nvim', as = 'nord' }    -- Theme
    use { 'Mofiqul/dracula.nvim', as = 'dracula' } -- Theme
    use { "catppuccin/nvim", as = "catppuccin" }   -- Theme
    use { 'rose-pine/neovim', as = 'rose-pine' }   -- Theme
    use { 'doums/darcula', as = 'darcula' }        -- Theme
    use 'Mofiqul/vscode.nvim'                      -- Theme
    use 'AlexvZyl/nordic.nvim'

    use 'nvim-tree/nvim-web-devicons'              -- Does some magic so we can have icons.
    use {
        'nvim-lualine/lualine.nvim',               -- Provides a nice status bar at the bottom of the screen
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }

    -- ##################################################
    -- ########## Navigation
    -- ##################################################
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1', -- Provides nice file jumping Capabilities
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }) -- Provides syntax highlighting
    use 'windwp/nvim-ts-autotag'                                  -- Provides Autoclose and autorename for html tags
    use 'ThePrimeagen/harpoon'                                    -- Allows for easier jumping between files
    use {
        'nvim-tree/nvim-tree.lua',                                -- Shows a nice file tree
        requires = { 'nvim-tree/nvim-web-devicons' },
    }

    use({
        'ggandor/leap.nvim', -- Easily go to text
        dependencies = { 'tpope/vim-repeat' },
    })

    -- ##################################################
    -- ########## Tutorials
    -- ##################################################
    use('ThePrimeagen/vim-be-good') -- Learn how to be better at vim
    use "folke/which-key.nvim"      -- Show tooltips what key combinations you can do

    -- ##################################################
    -- ########## Editor
    -- ##################################################

    use 'gpanders/editorconfig.nvim'             -- Editorconfig support
    use 'mbbill/undotree'                        -- Nice undo visualization
    use 'tpope/vim-fugitive'                     -- Git operations
    use 'jiangmiao/auto-pairs'                   -- Automatically pair up closing brackets and other symbols
    use { "akinsho/toggleterm.nvim", tag = '*' } -- Nice terminal
    use 'romgrk/barbar.nvim'                     -- Tabs
    use 'airblade/vim-gitgutter'                 -- Shows if a line has been added/modified/etc
    use 'numToStr/Comment.nvim'
    use 'RRethy/vim-illuminate'

    use({
        'nvim-pack/nvim-spectre', -- Global Search and replace
    })

    use 'dstein64/vim-startuptime'  -- Measures startuptime
    use { 'kevinhwang91/nvim-bqf' } -- Better Quickfix

    use { 'junegunn/fzf', run = function()
        vim.fn['fzf#install']()
    end }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

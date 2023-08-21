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


    -- ########## LSP Stuff
    use {
        'VonHeikemen/lsp-zero.nvim', -- LSP-zero makes it really easy to have LSP Support
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    -- ########## Themeing
    use { 'shaunsingh/nord.nvim', as = 'nord' }    -- Theme
    use { 'Mofiqul/dracula.nvim', as = 'dracula' } -- Theme
    use { "catppuccin/nvim", as = "catppuccin" } -- Theme
    use 'nvim-tree/nvim-web-devicons'               -- Does some magic so we can have icons.
    use {
        'nvim-lualine/lualine.nvim',                -- Provides a nice status bar at the bottom of the screen
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }
    use({
        "utilyre/barbecue.nvim", -- Adds breadcrumbs on the top
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    })

    use 'RRethy/vim-illuminate'

    -- ########## Navigation
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1', -- Provides nice file jumping Capabilities
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }) -- Provides syntax highlighting
    use 'ThePrimeagen/harpoon'                                    -- Allows for easier jumping between files
    use {
        'nvim-tree/nvim-tree.lua',                                -- Shows a nice file tree
        requires = { 'nvim-tree/nvim-web-devicons' },
    }

    -- ########## Tutorials
    use('ThePrimeagen/vim-be-good') -- Learn how to be better at vim
    use {
        "folke/which-key.nvim",     -- Show tooltips what key combinations you can do
    }

    -- ########## Editor
    use 'gpanders/editorconfig.nvim' -- Editorconfig support
    use 'mbbill/undotree'            -- Nice undo visualization
    use 'tpope/vim-fugitive'         -- Git operations
    use 'jiangmiao/auto-pairs'       -- Automatically pair up closing brackets and other symbols
    use { "akinsho/toggleterm.nvim", tag = '*'} -- Nice terminal
    use 'f-person/git-blame.nvim' -- Git blame to the end of the line
    use 'lewis6991/gitsigns.nvim' -- No clue, some dep
    use 'romgrk/barbar.nvim'      -- Tabs
    use 'airblade/vim-gitgutter'  -- Shows if a line has been added/modified/etc
    use 'tpope/vim-commentary'    -- Easily Comment Lines

    use({
        "kylechui/nvim-surround", -- Allows us to easily surround text with delimiters
        tag = "*",                -- Use for stability; omit to use `main` branch for the latest features
    })

    use({
        'folke/trouble.nvim', -- Gives us issues for the workspace/file
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    })

    use({
        'nvim-pack/nvim-spectre', -- Global Search and replace
    })

    use({
        'ggandor/leap.nvim', -- Easily go to text
        dependencies = { 'tpope/vim-repeat' },
    })

    if packer_bootstrap then
        require('packer').sync()
    end
end)

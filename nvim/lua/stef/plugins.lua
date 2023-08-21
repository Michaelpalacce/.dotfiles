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
    use({ 'shaunsingh/nord.nvim', as = 'nord' })    -- Theme
    use({ 'Mofiqul/dracula.nvim', as = 'dracula' }) -- Theme
    use 'nvim-tree/nvim-web-devicons'               -- Does some magic so we can have icons.
    use {
        'nvim-lualine/lualine.nvim',                -- Provides a nice status bar at the bottom of the screen
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup {
                options = { theme = 'dracula' }
            }
        end
    }
    use({
        "utilyre/barbecue.nvim", -- Adds breadcrumbs on the top 
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons", -- keep this if you're using NvChad
        config = function()
            require("barbecue").setup()
        end,
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
        requires = {
            'nvim-tree/nvim-web-devicons',                        -- optional
        },
    }

    -- ########## Tutorials
    use('ThePrimeagen/vim-be-good') -- Learn how to be better at vim
    use {
        "folke/which-key.nvim",     -- Show tooltips what key combinations you can do
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 0
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- ########## Editor
    use 'gpanders/editorconfig.nvim' -- Editorconfig support
    use 'mbbill/undotree'            -- Nice undo visualization
    use 'tpope/vim-fugitive'         -- Git operations
    use 'jiangmiao/auto-pairs'       -- Automatically pair up closing brackets and other symbols
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
    use 'f-person/git-blame.nvim' -- Git blame to the end of the line
    use 'lewis6991/gitsigns.nvim' -- No clue, some dep
    use 'romgrk/barbar.nvim'      -- Tabs
    use 'airblade/vim-gitgutter'  -- Shows if a line has been added/modified/etc
    use 'tpope/vim-commentary'    -- Easily Comment Lines

    use({
        "kylechui/nvim-surround", -- Allows us to easily surround text with delimiters
        tag = "*",                -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use({
        'folke/trouble.nvim', -- Gives us issues for the workspace/file
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    })

    use({
        'nvim-pack/nvim-spectre', -- Global Search and replace
        config = function ()
            require('spectre').setup()
        end
    })

    use({
        'ggandor/leap.nvim', -- Easily go to text 
        dependencies = { 'tpope/vim-repeat' },
        config = function ()
            require('leap').add_default_mappings()
        end
    })

    if packer_bootstrap then
        require('packer').sync()
    end
end)

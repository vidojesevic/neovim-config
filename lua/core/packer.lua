-- = = = = = = = = = = = = = --
-- ==        Packer       == --
-- = = = = = = = = = = = = = --

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use { 'wbthomason/packer.nvim' }
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use { 'nvim-treesitter/playground' }
    use { 'mbbill/undotree' }

    use { 'ThePrimeagen/harpoon' }
    use { 'tpope/vim-fugitive' }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            --Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use { 'ryanoasis/vim-devicons' }

    -- Colorschemes --
    use { 'tomasiser/vim-code-dark' }
    use { 'AlexvZyl/nordic.nvim' }
    use { 'rebelot/kanagawa.nvim' }
    use { 'olivercederborg/poimandres.nvim', as = 'poimandres' }
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use { 'windwp/nvim-ts-autotag' }
    use { 'ThePrimeagen/vim-be-good' }
    use {
        "nvim-neorg/neorg",
        requires = "nvim-lua/plenary.nvim",
    }
    use { "mhinz/vim-startify" }

    -- AI --
    use { 'nvim-lua/plenary.nvim' }

    -- Fun Stuff
    use { 'eandrju/cellular-automaton.nvim' }

    -- For xdebug PHP
    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'theHamsta/nvim-dap-virtual-text' }
    use { 'nvim-telescope/telescope-dap.nvim' }

    -- CMD center
    use {
        'folke/noice.nvim',
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }

    -- Magento2 LSP
    use({
        'pbogut/magento2-ls',
        -- Build using cargo build --release
        -- run = "require'magento2_ls'.build()" ,
        -- Alternatively, you can download the compiled binary from the GitHub release.
        run = "require'magento2_ls'.get_server()" ,
        config = "require'magento2_ls'.setup()"
    })
    use { 'praem90/nvim-phpcsf' }
    use { 'brett-griffin/phpdocblocks.vim' }
    use {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = {},
    }

    -- notes
    use {
        'renerocksai/telekasten.nvim',
        requires = {'nvim-telescope/telescope.nvim'}
    }

    -- AI helpers --
    use {
        "Exafunction/codeium.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
            })
        end
    }
end)

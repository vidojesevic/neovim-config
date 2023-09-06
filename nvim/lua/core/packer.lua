-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use { 'wbthomason/packer.nvim' }
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use { 'AlexvZyl/nordic.nvim' }
    use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use { 'nvim-treesitter/playground' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'ThePrimeagen/harpoon' }
    use { 'mbbill/undotree' }
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

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use { 'ryanoasis/vim-devicons' }
    use { 'ray-x/web-tools.nvim' }
    use { 'rebelot/kanagawa.nvim' }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use { 'windwp/nvim-ts-autotag' }
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use { 'ThePrimeagen/vim-be-good' }

end)

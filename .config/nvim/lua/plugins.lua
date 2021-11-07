return require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use 'sainnhe/edge'

    -- Tools
    use 'norcalli/nvim-colorizer.lua'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }

    -- Lsp server
    use 'neovim/nvim-lspconfig'

    -- Snippet
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    --Autocompletion
    use'hrsh7th/nvim-cmp'
    use'hrsh7th/cmp-nvim-lsp'

    --Treesitter
    use'nvim-treesitter/nvim-treesitter'
end)

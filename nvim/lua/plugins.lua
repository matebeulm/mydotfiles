return {

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    -- Colorscheme
    {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd.colorscheme('tokyonight-storm')
        end,
    },

    -- leap (Better Navigation)
    {
        "ggandor/leap.nvim",
        config = function()
            require('leap').add_default_mappings()
        end,
    },

    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Auto Pairs
    {
        "windwp/nvim-autopairs"
    },

    -- Nvim-Surround (Manipulating Surroundings)
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- Undo-Tree
    {
        "jiaoshijie/undotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Indentation Highlighting
    {
        "lukas-reineke/indent-blankline.nvim",
    },

    -- Rainbow Highlighting
    {
        "HiPhish/nvim-ts-rainbow2",
    },

    -- Git Integration
    {
        "lewis6991/gitsigns.nvim",
    },

    -- Language Support
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    },

    -- Nvimtree (File Explorer)
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },

    -- Telescope (Fuzzy Finder)
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        dependencies = {
            {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-fzf-native.nvim'
            },
        },
    },

    -- Toggle Term
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
    },

    -- whichkey
    {
        "folke/which-key.nvim",
        lazy = true
    },
}

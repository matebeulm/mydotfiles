-- plugins.lua

return {
  -- plugins will be added here accordingly

  -- Which-key Extension
  "folke/which-key.nvim",
  lazy = true,
  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  -- Colorscheme
  {
    'folke/tokyonight.nvim',
  },
  -- Lualine (THE NEW EXTENSION ADDED IN CONFIGURATION)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  -- Hop (Better Navigation)
  {
    "phaazon/hop.nvim",
    lazy = true,
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
      { 'nvim-lua/plenary.nvim' },
    }
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
  },
  -- Toggle Term
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },
  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
    dependencies = {
      { 'hrsh7th/nvim-cmp' },
    }
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
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  },
  -- neovim-tasks
  {
    'Shatur/neovim-tasks',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
  }
}

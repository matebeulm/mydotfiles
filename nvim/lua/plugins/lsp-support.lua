return {
  -- Language Support
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

    -- navigation
    { "SmiteshP/nvim-navic" },
  },
  keys = {
    { "<leader>ge", "<cmd>vim.diagnostic.open_float()<cr>",          desc = "open diagnostics" },
    { "gD",         "<cmd>vim.lsp.buf.declaration()<cr>",            desc = "goto declaration" },
    { "gd",         "<cmd>vim.lsp.buf.definition()<cr>",             desc = "goto definition" },
    { "gi",         "<cmd>vim.lsp.buf.implementation()<cr>",         desc = "goto implementation" },
    { "gh",         "<cmd>vim.lsp.buf.hover()<cr>",                  desc = "hover" },
    { "gr",         "<cmd>vim.lsp.buf.references()<cr>",             desc = "goto references" },
    { "gc",         "<cmd>vim.lsp.buf.rename()<cr>",                 desc = "rename symbol" },
    { "gf",         function() vim.lsp.buf.format({ async = true }) end, desc = "rename symbol" },
  },
  config = function()
    require("lsp-zero").preset("recommended")
    require("lsp-zero").nvim_workspace()
    require("lsp-zero").setup()
    require("lspconfig").clangd.setup({
      on_attach = function(client, bufnr)
        require("nvim-navic").attach(client, bufnr)
      end
    })
    require 'lspconfig'.rust_analyzer.setup({
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = false,
          }
        }
      },
      on_attach = function(client, bufnr)
        require("nvim-navic").attach(client, bufnr)
      end
    })
  end
}

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "jbyuki/one-small-step-for-vimkind" },
    { "nvim-telescope/telescope.nvim"},
    { "nvim-treesitter/nvim-treesitter"},
  },
  config = function ()
    require('telescope').load_extension('dap')
  end
}

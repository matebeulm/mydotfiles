return {
  "shatur/neovim-tasks",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  event = "BufEnter *.rs",
  config = function()
    require("tasks").setup {
      default_params = {
        cargo = {
          dap_name = "codelldb",
        },
      },
    }
  end,
}

return {
  {
    "shatur/neovim-tasks",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "mfussenegger/nvim-dap" },
    },
    -- keys = {
    --   { "<leader>cb", "<cmd>Task start cmake build<cr>", desc = "cmake build" },
    --   {
    --     "<leader>cc",
    --     "<cmd>Task start cmake configure<cr>",
    --     desc = "cmake configure",
    --   },
    --   { "<leader>cd", "<cmd>Task start cmake debug<cr>", desc = "cmake debug" },
    --   { "<leader>cr", "<cmd>Task start cmake run<cr>", desc = "cmake run" },
    --   { "<leader>rb", "<cmd>Task start cargo build<cr>", desc = "cargo build" },
    --   { "<leader>rd", "<cmd>Task start cargo debug<cr>", desc = "cargo debug" },
    --   { "<leader>rr", "<cmd>Task start cargo run<cr>", desc = "cargo run" },
    --   { "<leader>rt", "<cmd>Task start cargo test<cr>", desc = "cargo test" },
    -- },
    config = function()
      require("tasks").setup({
        defaulte_params = {
          cargo = {
            dap_name = "codelldb",
          },
        },
      })
    end,
  },
}

return {

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "ron",
        "rust",
        "toml",
      })
    end,
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "rust-analyzer",
        "codelldb",
        "taplo",
        "json-lsp",
      },
    },
  },

  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "mfussenegger/nvim-dap" },
    },
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end,
  },

  {
    "shatur/neovim-tasks",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "mfussenegger/nvim-dap" },
    },
    keys = {
      { "<leader>rb", "<cmd>Task start cargo build<cr>", desc = "cargo build" },
      { "<leader>rd", "<cmd>Task start cargo debug<cr>", desc = "cargo debug" },
      { "<leader>rr", "<cmd>Task start cargo run<cr>", desc = "cargo run" },
      { "<leader>ra", "<cmd>Task set_task_param cargo run<cr>", desc = "cargo set argument" },
    },
    config = function()
      require("tasks").setup({})
    end,
  },
}

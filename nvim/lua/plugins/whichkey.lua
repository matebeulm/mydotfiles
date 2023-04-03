return {
  -- Which-Key
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
    require("which-key").setup({})
    require("which-key").register({
      q = { "<cmd>wqall!<cr>", "quit" },
      k = { "<cmd>bdelete<cr>", "delete current buffer" },
      o = { "<cmd>only<cr>", "only" },
      f = {
        name = "file",
        r = { "<cmd>lua vim.lsp.buf.format({async=true})<cr>", "reformat file" },
        c = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename" },
        s = { "<cmd>ClangdSwitchSourceHeader<cr>", "switch header source in cpp" },
      },
      l = {
        -- name = "lsp related",
        -- d = { "<cmd>Telescope lsp_definitions<cr>", "goto definition" },
        -- D = { "<cmd>Telescope lsp_implementations<cr>", "goto declaration" },
        -- h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "hover" },
        -- r = { "<cmd>Telescope lsp_references<cr>", "references" },
        -- s = { "<cmd>Telescope lsp_signature_help()<cr>", "signature help" },
        -- t = { "<cmd>Telescope lsp_type_definitions<cr>", "type definition" },
        -- w = { "<cmd>Telescope lsp_document_symbols<cr>", "document symbol" },
        -- W = { "<cmd>Telescope lsp_workspace_symbols<cr>", "workspace symbol" },
        -- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "code action" },
      },
    }, { prefix = "<leader>" })
  end,
}


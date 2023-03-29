return {
  -- Which-Key
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({})
    require("which-key").register({
      q = { "<cmd>wqall!<cr>", "quit" },
      w = { "<cmd>w!<cr>", "Save" }, -- Save current file
      k = { "<cmd>bdelete<cr>", "delete current buffer" },
      f = {
        name = "file",
        r = { "<cmd>lua vim.lsp.buf.format({async=true})<cr>", "reformat file" },
      },
      g = {
        name = "lsp related",
        d = { "<cmd>Telescope lsp_definitions<cr>", "goto definition" },
        D = { "<cmd>Telescope lsp_declarations<cr>", "goto declaration" },
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "hover" },
        gr = { "<cmd>Telescope lsp_references<cr>", "references" },
        gs = { "<cmd>Telescope lsp_signature_help()<cr>", "signature help" },
        gi = { "<cmd>Telescope lsp_implementaions<cr>", "implementaion" },
        gt = { "<cmd>Telescope lsp_type_definitions<cr>", "type definition" },
        w = { "<cmd>Telescope lsp_document_symbols<cr>", "document symbol" },
        W = { "<cmd>Telescope lsp_workspace_symbols<cr>", "workspace symbol" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "code action" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "format" },
        s = { "<cmd>CLangdSwitchSourceHeader<cr>", "switch header source in cpp" },
      },
    }, { prefix = "<leader>" })
  end,
}

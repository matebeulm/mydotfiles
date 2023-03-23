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
			}
		}, { prefix = "<leader>" })
	end,
}

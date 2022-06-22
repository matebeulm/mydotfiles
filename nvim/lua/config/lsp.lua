local M = {}

function M.setup()

	-- local servers = { "pyright", "rust_analyzer", "clangd", "gdscript" }
	local servers = { "clangd" }
	for _, lsp in pairs(servers) do
		require("lspconfig")[lsp].setup({
			on_attach = on_attach,
			flags = {
				-- This will be the default in neovim 0.7+
				debounce_text_changes = 150,
			},
		})
	end

	require("lspconfig").clangd.setup({})

end

return M

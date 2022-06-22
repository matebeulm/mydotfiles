local M = {}

local nvim_lsp = require("lspconfig")
local servers = { "clangd", "pylsp", "sumneko_lua" }

function M.setup()
	require("lspconfig").pylsp.setup({})
	require("lspconfig").clangd.setup({})
	require("lspconfig").sumneko_lua.setup({
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})

	for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup({
			capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		})
	end
end

return M

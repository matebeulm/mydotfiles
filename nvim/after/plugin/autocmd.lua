if vim.fn.has("nvim-0.7") then
	local api = vim.api

	-- highlight on yank
	local yankGrp = api.nvim_create_augroup("YankHighLight", { clear = true })
	api.nvim_create_autocmd("TextYankPost", {
		command = "silent! lua vim.highlight.on_yank()",
		group = yankGrp,
	})

	-- go to last loc when opening a buffer
	api.nvim_create_autocmd(
		"BuFReadPost",
		{ command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
	)
end

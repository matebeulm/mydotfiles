require('formatter').setup({
	logging = False,
	filetype = {
		cpp = {
			-- clang-format
			function()
				return {
					exe = 'clang-format',
					args = { '--assume-filename', vim.api.nvim_buf_get_name(0) },
					stdin = true,
					cwd = vim.fn.expand('%:p:h'), -- Run clang-format in cwd of the file.
				}
			end,
		},
		json = {
			-- prettier
			function()
				return {
					exe = 'prettier',
					args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote' },
					stdin = true,
				}
			end,
		},
		lua = {
			-- luafmt
			function()
				return {
					-- exe = "luafmt",
					-- args = {"--indent-count", 2, "--stdin"},
					-- stdin = true
					exe = 'stylua',
					args = {
						'--indent-type tabs',
						'--quote-style AutoPreferSingle',
						'--indent-width 2',
						'-',
					},
					stdin = true,
				}
			end,
		},
	},
})

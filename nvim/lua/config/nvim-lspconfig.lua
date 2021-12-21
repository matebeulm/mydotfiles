require('lspconfig').pyright.setup({})

require('lspconfig').clangd.setup({
	cmd = {
		'/opt/homebrew/opt/llvm/bin/clangd',
		'--background-index',
		'--suggest-missing-includes',
	},
	filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
})

require('lspconfig').cmake.setup({
	cmd = { 'cmake-language-server' },
	filetypes = { 'cmake' },
	init_options = {
		buildDirectory = 'build',
	},
	root_dir = require('lspconfig').util.root_pattern('.git', 'compile_commands.json', 'build'),
	single_file_support = true,
})

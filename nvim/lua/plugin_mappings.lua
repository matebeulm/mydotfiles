local map = vim.api.nvim_set_keymap
default_options = { noremap = true, silent = true }
expr_options = { noremap = true, expr = true, silent = true }

-- map the leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', default_options)
vim.g.mapleader = ' '

map('n', '<leader>ev', '<cmd>e $MYVIMRC<cr>', default_options)
-- map('n', '<leader>sv', '<cmd>so %<cr>', default_options)

-- map('n', '<tab>', '<cmd>bnext<cr>', default_options)
-- map('n', '<s-tab>', '<cmd>bprevious<cr>', default_options)

map('n', '<leader>cl', '<cmd>nohlsearch<bar><cmd>echo<cr>', default_options)

-- configure telescope
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", default_options)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", default_options)
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", default_options)
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", default_options)

-- formatter
map('n', '<leader>F', '<cmd>Format<cr>', default_options)

map('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<cr>', default_options)
map(
	'n',
	'<leader>dB',
	'<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition<cmd> "))<cr>',
	default_options
)
map('n', '<leader>dd', '<cmd>Telescope dap configurations<cr>', default_options)

map('n', '<leader>dO', '<cmd>lua require"dap".step_out()<cr>', default_options)
map('n', '<leader>di', '<cmd>lua require"dap".step_into()<cr>', default_options)
map('n', '<leader>do', '<cmd>lua require"dap".step_over()<cr>', default_options)
map('n', '<leader>dc', '<cmd>lua require"dap".continue()<cr>', default_options)

map('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<cr>', default_options)

map('n', '\\', '<cmd>NvimTreeToggle<cr>', default_options)

map('n', '<leader>sw', '<cmd>ClangdSwitchSourceHeader<cr>', default_options)

map('n', 'gs', '<cmd>Telescope lsp_document_symbols<cr>', default_options)
map('n', 'gh', '<cmd>lua vim.lsp.buffer.hover()<cr>', default_options)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', default_options)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', default_options)
map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', default_options)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', default_options)
map('n', 'gr', '<cmd>Telescope lsp_references<cr>', default_options)
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', default_options)

map('n', '<leader>so', '<cmd>SymbolsOutline<cr>', default_options)

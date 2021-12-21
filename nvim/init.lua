--------------------------------
-- general settings
--------------------------------

local o = vim.opt

o.expandtab = true
o.shiftwidth = 4
o.hidden = true
o.signcolumn = 'yes:2'
o.relativenumber = true
o.number = true
o.termguicolors = true
o.undofile = true
o.spell = false
o.title = true
o.ignorecase = true
o.smartcase = true
o.wildmode = 'longest:full,full'
o.wrap = false
o.list = true
o.listchars = 'tab:▶ ,trail:.'
o.mouse = 'a'
o.scrolloff = 8
o.sidescrolloff = 8
o.joinspaces = false
o.splitright = true
o.clipboard = 'unnamedplus'
o.confirm = true
o.exrc = true
-- o.backup = true
-- o.backupdir='~/.local/share/nvim/backup//'
o.updatetime = 300 -- reduce time for highlighting other references
o.redrawtime = 10000 -- allow more time for loading syntax on large files

--------------------------------
--  key mappings for neovim
--------------------------------

-- local map = vim.api.nvim_set_keymap
function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

map('n', '<leader>ve', '<cmd>edit $MYVIMRC<cr>')
-- map('n', '<leader>vc', '<cmd>edit $MYVIMRC<cr>')
map('n', '<leader>vr', '<cmd>source $MYVIMRC<cr>')

map('n', '<leader>k', '<cmd>nohlsearch<cr>')
map('n', '<leader>Q', '<cmd>bufdo bdelete<cr>')

-- allow gf to open nonexistent files
map('n', 'gf', '<cmd>edit <cfile><cr>', { noremap = false })
-- map('n', 'gl', 'v:lua.edit_lua("hallo")')
-- vim.api.nvim_set_keymap('n', 'gf', '<cmd>edit <cfile><cr>', {noremap = false})

-- reselect visual selection after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- maintain cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
map('v', 'y', 'myy`y')
map('v', 'Y', 'myY`y')

-- when text is wrapped, move by terminal rows, not lines, unless a count is provided
map('n', '<silent> <expr> j', '(v:count == 0) ? "gj" : "j"')
map('n', '<silent> <expr> k', '(v:count == 0) ? "gk" : "j"')

-- open the current file in the default program
map('n', '<leader>x', '<cmd>!xdg-open %<cr><cr>')

-- quickly escape to normal mode
map('i', 'jj', '<esc>')

map('c', 'w!!', '%!sudo tee > /dev/null %')

--------------------------------
-- plugins
--------------------------------
require('plugins')

--------------------------------
-- key mappings for modules
--------------------------------
require('plugin_mappings')

-- Remove all trailing whitespace on save
vim.api.nvim_exec(
	[[
  augroup TrimWhiteSpace
    au!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END
  ]],
	false
)

--------------------------------
-- auto commands
--------------------------------

-- Prevent new line to also start with a comment
vim.api.nvim_exec(
	[[
  augroup NewLineComment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END
  ]],
	false
)

-- set commentstring for certain file types
-- when you enter a (new) buffer
-- when you've changed the name of a file opened in a buffer, the file type may have changed
vim.api.nvim_exec(
	[[
  augroup set-commentstring-ag
    autocmd!
    autocmd BufEnter *.cpp,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    autocmd BufFilePost *.cpp,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    augroup END
  ]],
	false
)

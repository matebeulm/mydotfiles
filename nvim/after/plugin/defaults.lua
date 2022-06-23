vim.g.python3_host_prog = "~/mambaforge/python"

local opt = vim.opt

-- default options
opt.completeopt = { "menu", "menuone", "noselect" }
opt.laststatus = 3
opt.mouse = "a"
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
-- opt.relativenumber = true
vim.cmd("set nonumber")
vim.cmd("set norelativenumber")
-- set diffopt+=vertical " starts diff mode in vertical split
opt.cmdheight = 1
-- set shortmess+=c " don't need to press enter so often
opt.signcolumn = "yes"
opt.updatetime = 520
opt.undofile = true
opt.timeoutlen = 500
opt.clipboard = "unnamedplus"

vim.cmd("filetype plugin on")
opt.backup = false
vim.g.netrw_banner = false
vim.g.netrw_liststyle = 3
vim.g.markdown_fenced_languages = { "javascript", "js=javascript", "json=javascript" }

-- opt.path:append({ "**" })
vim.cmd([[set path=$PWD/**]])

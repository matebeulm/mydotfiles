local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = " "

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
opt.so = 10
-- opt.relativenumber = true
vim.cmd("set nonumber")
vim.cmd("set norelativenumber")
-- set diffopt+=vertical " starts diff mode in vertical split
opt.cmdheight = 1
opt.ls = 0
-- set shortmess+=c " don't need to press enter so often
opt.signcolumn = "yes"
opt.updatetime = 520
opt.undofile = true
cmd("filetype plugin on")
opt.backup = false
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = { "javascript", "js=javascript", "json=javascript" }

-- opt.path:append({ "**" })
vim.cmd([[set path=$PWD/**]])
vim.keymap.set("n", "<leader>v", ":e $MYVIMRC<CR>")

require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				styles = { functions = "bold", keywords = "italic" },
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{ "mhartington/formatter.nvim" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup({})
		end,
	},
	{
		"echasnovski/mini.completion",
		version = false,
		config = function()
			require("mini.completion").setup({})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup({})
		end,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("mini.comment").setup({})
		end,
	},
	{
		"echasnovski/mini.statusline",
		version = false,
		config = function()
			require("mini.statusline").setup({})
		end,
	},
	{
		"echasnovski/mini.tabline",
		version = false,
		config = function()
			require("mini.tabline").setup({})
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup({})
		end,
	},
	{
		"echasnovski/mini.jump",
		version = false,
		config = function()
			require("mini.jump").setup({})
		end,
	},
})

require("mason").setup()
require("mason-lspconfig").setup()
-- require("mason-lspconfig").setup_handlers {
--     function(server_name) -- default handler (optional)
--         require("lspconfig")[server_name].setup {}
--     end,
--     ["lua_ls"] = function()
--         require("lspconfig").lua_ls.setup({
--             settings = {Lua = {diagnostics = {globals = {'vim'}}}}
--         })
--     end
-- }

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "cpp", "rust", "lua" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
})

require("telescope").setup({
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})
require("telescope").load_extension("fzy_native")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.keymap.set("n", "<leader>F", ":Format<CR>")
require("formatter").setup({
	logging = false,
	filetype = {
		javascript = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},
		json = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},
		rust = {
			function()
				return { exe = "rustfmt", stdin = true }
			end,
		},
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,
		},
		--		lua = {function() return {exe = "lua-format", stdin = true} end},
		sql = {
			-- prettierd
			function()
				return {
					exe = "sqlformat",
					args = { vim.api.nvim_buf_get_name(0), "-a" },
					stdin = true,
				}
			end,
		},
	},
})
local telescope_actions = require("telescope.actions.set")

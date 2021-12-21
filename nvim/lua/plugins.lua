local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
	return string.format("require('config/%s')", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	execute('packadd packer.nvim')
end

-- initialize and configure packer
local packer = require('packer')
packer.init({
	enable = true, -- enable profiling via :PackerCompile profile=true
	threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
})
local use = packer.use
packer.reset()

-- actual plugins list
use('wbthomason/packer.nvim')

use({
	'nvim-telescope/telescope.nvim',
	requires = {
		{ 'nvim-lua/popup.nvim' },
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-fzy-native.nvim' },
		{ 'nvim-telescope/telescope-symbols.nvim' },
	},
	config = get_config('telescope'),
})

use({
	'nvim-treesitter/nvim-treesitter',
	config = get_config('treesitter'),
	run = ':TSUpdate',
})

use({
	'terrortylor/nvim-comment',
	config = get_config('comment'),
})

use({
	'mhartington/formatter.nvim',
	config = get_config('formatter'),
})

use({
	'cdelledonne/vim-cmake',
	config = get_config('cmake'),
})

use({
	'lukas-reineke/indent-blankline.nvim',
	config = get_config('blankline'),
})

use({
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	config = get_config('lualine'),
})

-- color scheme nord with lush
use({
	'kunzaatko/nord.nvim',
	requires = { 'rktjmp/lush.nvim', opt = true },
	config = get_config('nord-theme'),
})

-- use({
-- 	'shaunsingh/nord.nvim',
-- 	config = get_config('nordtheme'),
-- })

-- Lua
use({
	'folke/which-key.nvim',
	config = get_config('which-key'),
})

use({
	'chrisbra/unicode.vim',
})

use({
	'ray-x/lsp_signature.nvim',
	config = get_config('lsp-signature'),
})

use({
	'neovim/nvim-lspconfig',
	config = get_config('nvim-lspconfig'),
})

use({
	'hrsh7th/nvim-cmp',
	requires = {
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'l3mon4d3/luasnip',
	},
	config = get_config('nvim-cmp'),
})

use({
	'mfussenegger/nvim-dap',
	config = get_config('nvim-dap'),
})

use({
	'rcarriga/nvim-dap-ui',
	requires = { 'mfussenegger/nvim-dap' },
	config = get_config('nvim-dap-ui'),
})

use({
	'nvim-telescope/telescope-dap.nvim',
	requires = {
		'mfussenegger/nvim-dap',
		'nvim-telescope/telescope.nvim',
		{ 'nvim-treesitter/nvim-treesitter', opt = true },
	},
	config = get_config('telescope-dap'),
})

use({
	'theHamsta/nvim-dap-virtual-text',
	requires = { { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }, 'mfussenegger/nvim-dap' },
	config = get_config('nvim-dap-virtual-text'),
})

use({
	'kyazdani42/nvim-tree.lua',
	requires = {
		'kyazdani42/nvim-web-devicons', -- optional, for file icon
	},
	config = get_config('nvim-tree'),
})

use({
	'simrat39/symbols-outline.nvim',
	config = get_config('symbols-outline'),
})

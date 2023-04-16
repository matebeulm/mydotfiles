local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use({ 
		'rose-pine/neovim', 
		as = 'rose-pine',
		config = function()
			vim.cmd.colorscheme("rose-pine")
		end
	})

	use({
		'nvim-telescope/telescope.nvim',
		tag = 'master',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use({
		"nvim-treesitter/playground"
	})

	use({
		"theprimeagen/harpoon",
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	use({ 'mbbill/undotree' })

	use({ 'tpope/vim-fugitive' })

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			{"neovim/nvim-lspconfig"},
			{"williamboman//mason.nvim"},
			{"williamboman//mason-lspconfig.nvim"},
			
			-- autocompletion
			{"hrsh7th/nvim-cmp"},
			{"hrsh7th/cmp-buffer"},
			{"hrsh7th/cmp-path"},
			{"saadparwaiz1/cmp_luasnip"},
			{"hrsh7th/cmp-nvim-lsp"},
			{"hrsh7th/cmp-nvim-lua"},

			-- snippets
			{"L3MON4D3/LuaSnip"},
			{"rafamadriz/friendly-snippets"},

		}
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)

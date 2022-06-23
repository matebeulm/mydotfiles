local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = " "

-- indicate first time installation
local packer_bootstrap = false

-- packer nvim configuration
local conf = {
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
}

-- check if packer.nvim is installed
-- run PackerCompile if there are changes in this file
local function packer_init()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		packer_bootstrap = fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
	end
	vim.cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")
end

local function plugins(use)
	use("wbthomason/packer.nvim")

	use({
		"marko-cerovac/material.nvim",
		config = function()
			-- vim.g.material_style = "darker"
			vim.cmd("colorscheme material")
		end,
	})

	use({
		"mhartington/formatter.nvim",
		config = function()
			require("config.formatter").setup()
		end,
	})

	-- use({
	-- 	"numToStr/Comment.nvim",
	-- 	config = function()
	-- 		require("Comment").setup()
	-- 	end,
	-- })

	use({
		"tpope/vim-commentary",
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = "<cmd>TSUpdate",
		config = function()
			require("config.treesitter").setup()
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("config.telescope").setup()
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp").setup()
		end,
	})

	use("L3MON4D3/LuaSnip")

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
		},
		config = function()
			require("config.nvim-cmp").setup()
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("config.which-key").setup()
		end,
	})

	use({
		"shatur/neovim-cmake",
		requires = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("config.cmake").setup()
		end,
	})

	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("config.dap").setup()
		end,
	})

	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("config.dap-ui").setup()
		end,
	})

	use({
		"windwp/nvim-autopairs",
		wants = "nvim-treesitter",
		module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
		config = function()
			require("config.autopairs").setup()
		end,
	})

	-- end of packages
end

packer_init()

local packer = require("packer")
packer.init(conf)
packer.startup(plugins)

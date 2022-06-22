local M = {}

function M.setup()
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

	-- plugins
	local function plugins(use)
		use({ "wbthomason/packer.nvim" })

		use({
			"marko-cerovac/material.nvim",
			config = function()
				vim.cmd("colorscheme material")
			end,
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
				{ "nvim-telescope/telescope-fzy-native.nvim" },
			},
			config = function()
				require("config.telescope").setup()
			end,
		})

		use({
			"mhartington/formatter.nvim",
			config = function()
				require("config.formatter").setup()
			end,
		})

		use({
			"numToStr/Comment.nvim",
			config = function()
				require("config.comment").setup()
			end,
		})
		-- use("tpope/vim-commentary")

		use({
			"shatur/neovim-cmake",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "mfussenegger/nvim-dap" },
			},
			config = function()
				require("config.cmake").setup()
			end,
		})

		use({
			"folke/which-key.nvim",
			config = function()
				require("config.whichkey").setup()
			end,
		})

		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("config.lsp").setup()
			end,
		})

		use({
			"TimUntersberger/neogit",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("config.neogit").setup()
			end,
		})

		use({
			"L3MON4D3/LuaSnip",
			config = function()
				require("config/luasnip").setup()
			end,
		})

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

		-- Debugging
		use({
			"mfussenegger/nvim-dap",
			opt = true,
			event = "BufReadPre",
			module = { "dap" },
			wants = { "nvim-dap-virtual-text", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
			requires = {
				"theHamsta/nvim-dap-virtual-text",
				"rcarriga/nvim-dap-ui",
				"mfussenegger/nvim-dap-python",
				"nvim-telescope/telescope-dap.nvim",
			},
			config = function()
				require("config.dap").setup()
			end,
		})

		if packer_bootstrap then
			print("restart neovim required after installation!")
			require("packer").sync()
		end
	end

	packer_init()

	local packer = require("packer")
	packer.init(conf)
	packer.startup(plugins)
end

return M

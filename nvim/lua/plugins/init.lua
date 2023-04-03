return {
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = { style = "moon" },
		config = function()
			vim.cmd.colorscheme('tokyonight')
		end,
	},

    -- telescope
    {
		'nvim-telescope/telescope.nvim',
		tag = 'master',
		-- or                            , branch = '0.1.x',
		dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    -- undo tree
    {
        "mbbill/undotree",
        keys = {
            {"<leader>u", "<cmd>UndotreeToggle<cr>", desc = "toggle undo tree"},
        }
    },

    { 
        'tpope/vim-fugitive',
        keys = {
            {"<leader>gs", "<cmd>Git<cr>", desc = "git status"},
        }
    },

    {
        -- Bufferline
        'akinsho/bufferline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            vim.opt.termguicolors = true

            require("bufferline").setup {
                options = {
                    hover = {
                        enabled = true,
                        delay = 150,
                        reveal = { 'close' }
                    },
                    diagnostics = "nvim_lsp",
                }
            }
        end
    },

    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end
    },
}

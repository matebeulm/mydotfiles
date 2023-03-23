return {
	-- Telescope (Fuzzy Finder)
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "find buffer" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "find text in files" },
	},
	config = function()
		-- telescope-config.lua

		require("telescope").setup({
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,

				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
			},
			pickers = {
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_ key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
			},
		})
	end,
}

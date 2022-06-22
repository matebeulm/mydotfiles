local M = {}

function M.setup()
	local whichkey = require("which-key")

	local conf = {
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		operators = { gc = "Comments" },
	}

	local opts = {
		mode = "n", -- Normal mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	}

	local mappings = {

		["w"] = { "<cmd>update!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },
		["o"] = { "<cmd>only<cr>", "only" },
		["F"] = { "<cmd>Format<cr>", "format" },

		b = {
			name = "Buffer",
			c = { "<Cmd>bd!<Cr>", "Close current buffer" },
			D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
		},

		f = {
			name = "files",
			f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files" },
			b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "find buffers" },
			g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "live grep" },
			s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "find_symbols" },
		},

		z = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},

		-- g = {
		-- 	name = "Git",
		-- 	s = { "<cmd>Neogit<CR>", "Status" },
		-- },

		c = {
			name = "cmake",
			c = { "<cmd>CMake configure<cr>", "configure" },
			r = { "<cmd>CMake run<cr>", "run" },
			b = { "<cmd>CMake build<cr>", "build" },
			x = { "<cmd>CMake cancel<cr>", "cancel" },
			s = { "<cmd>CMake select_target<cr>", "select_target" },
		},
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)
end

return M

-- local M = {}
--
-- function M.setup()
-- 	local wk = require("which-key")
--
-- 	wk.setup({
-- 		operators = { gc = "Comments" },
-- 	})
--
-- 	wk.register({
-- 		f = {
-- 			name = "file",
-- 			f = { "<cmd>Telescope find_files<cr>", "find file" }, -- create binding with label
-- 			g = { "<cmd>Telescope live_grep<cr>", "find string" },
-- 			gg = { "<cmd>Telescope grep_string<cr>", "find string under cursor" },
-- 			b = { "<cmd>Telescope buffers<cr>", "find buffer" },
-- 			s = { "<cmd>Telescope lsp_document_symbols<cr>", "find symbols" },
-- 		},
-- 	}, { prefix = "<leader>" })
-- end
--
-- return M

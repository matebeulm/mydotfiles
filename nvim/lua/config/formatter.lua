local M = {}

-- Utilities for creating configurations
local util = require("formatter.util")

function M.setup()
  	require("formatter").setup({
		filetype = {
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			cmake = {
				function()
					return {
						exe = "cmake-format",
						args = {
							util.escape_path(util.get_current_buffer_file_path()),
						},
						stdin = true,
					}
				end,
			},
			cpp = {
				require("formatter.filetypes.cpp").clangformat,
			},
			json = {
				function()
					return {
						exe = "fixjson",
						args = {
							"-i 2",
							"--stdin-filename",
							util.escape_path(util.get_current_buffer_file_path()),
						},
						stdin = true,
					}
				end,
			},
		},
	})
end

return M

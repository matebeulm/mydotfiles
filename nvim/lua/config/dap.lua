local M = {}

local dap = require("dap")

local function configure_debuggers()
	require("config.dap.cpp").setup()
end

function M.setup()
	dap.defaults.fallback.terminal_win_cmd = "20split new"
	vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

	dap.adapters.lldb = {
		type = "executable",
		command = "C:/msys64/clang64/bin/lldb-vscode", -- adjust as needed, must be absolute path
		name = "lldb",
	}
	configure_debuggers()
end

return M

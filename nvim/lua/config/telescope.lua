local M = {}

function M.setup()
	-- local telescope_actions = require('telescope.actions.set')
	--
	-- local fixfolds = {
	-- 	hidden = true,
	-- 	attach_mappings = function(_)
	-- 		telescope_actions.select:enhance({
	-- 			post = function()
	-- 				vim.cmd('<cmd>normal! zx')
	-- 			end,
	-- 		})
	-- 		return true
	-- 	end,
	-- }

	-- local status_ok, telescope = pcall(require, 'telescope')
	-- if not status_ok then
	-- 	return
	-- end

	-- telescope.setup({
	-- pickers = {
	-- 	buffers = fixfolds,
	-- 	find_files = fixfolds,
	-- 	git_files = fixfolds,
	-- 	grep_string = fixfolds,
	-- 	live_grep = fixfolds,
	-- 	oldfiles = fixfolds,
	-- },
	-- })

	require("telescope").setup({
		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
			},
		},
	})
	require("telescope").load_extension("fzy_native")

end

return M

-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                              , branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "telescope find files"},
        {"<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "telescope live grep"},
        {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "telescope find buffers"},
        {"<leader>fg", "<cmd>Telescope git_files<cr>", desc = "telescope git files"},
        {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "telescope help tags"},
    },
}

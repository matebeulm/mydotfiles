-- harpoon
return {
    "theprimeagen/harpoon",
    dependencies = { {'nvim-lua/plenary.nvim'} },
    keys = {
        {"<leader>a", function() require("harpoon.mark").add_file() end, desc = "add file"},
        {"<C-e>", function() require('harpoon.ui').toggle_quick_menu() end, desc = "toggle ui"},

        {"<C-h>", function() require("harpoon.ui").nav_file(1) end, desc = "file 1" },
        {"<C-t>", function() require("harpoon.ui").nav_file(2) end, desc = "file 2" },
        {"<C-n>", function() require("harpoon.ui").nav_file(3) end, desc = "file 3" },
        {"<C-s>", function() require("harpoon.ui").nav_file(4) end, desc = "file 4" },
    },
}

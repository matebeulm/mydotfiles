return {
  {
    'SmiteshP/nvim-navic',
    dependencies = { { 'neovim/nvim-lspconfig' } },
    config = function()
      require('nvim-navic').setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    event = 'BufEnter',
    config = function()
      local navic = require 'nvim-navic'

      require('lualine').setup {
        sections = {
          lualine_c = {
            { 'filename', path = 1 },
            {
              function()
                return navic.get_location()
              end,
              cond = function()
                return navic.is_available()
              end,
            },
          },
        },
        -- OR in winbar
        -- winbar = {
        -- 	lualine_c = {
        -- 		{
        -- 			function()
        -- 				return navic.get_location()
        -- 			end,
        -- 			cond = function()
        -- 				return navic.is_available()
        -- 			end,
        -- 		},
        -- 	},
        -- },
      }
    end,
  },
}

local M = {}

local cmp = require("cmp")
local ls = require("luasnip")

function M.setup()
	cmp.setup({
		snippet = {
			--    -- required: you must specify a snippets engine
			expand = function(args)
				--      -- vim.fn["vsnip.anonymous"](args.body)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				--        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
				--        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			end,
		},
		mapping = {
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if ls.jumpable(-1) then
					ls.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		sources = {
			{ name = "npm" },
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "buffer", keyword_length = 5 },
		},
	})
end

return M

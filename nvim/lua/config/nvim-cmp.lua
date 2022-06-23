local M = {}

local ls = require("luasnip")
local cmp = require("cmp")

-- Auto pairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

function M.setup()
	cmp.setup({
		snippet = {
			expand = function(args)
				ls.lsp_expand(args.body)
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
			-- { name = "npm" },
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "buffer", keyword_length = 5 },
		},
		-- formatting = {
		--   format = lspkind.cmp_format({with_text = false, maxwidth = 50})
		-- }
	})

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

return M
